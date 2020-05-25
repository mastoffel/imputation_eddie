# Creating the genotype files and other files for AlphaImpute
# this script outputs three files:
# (1) Genotypes.txt: complete genotype data, can be filter for chromosomes
# (2) to_be_imputed_index.txt: index of SNPs which have to be masked and imputed
# (3) to_be_imputed.txt: names of SNPs
# (4) AlphaImputeLinux
# (5) Pedigree.txt

library(snpStats)
library(tidyverse)
library(data.table)
source("create_spec_file_merged_sexchr.R")
#library(gdata)
#library("WGCNA")
# browseVignettes("snpStats")

# capture command line arguments
# either 1-27 for the chromosomes or all_chr for full data

args <- commandArgs(trailingOnly=TRUE)

if (purrr::is_empty(args)) {
    stop("Provide a chromosome number as argument")
    chr_num <- NULL
} else if (args[[1]] == "all_chr") { # command for full dataset
    stop("Only accepts chromosome numbers from 1-26 at the moment")
    chr_num <- NULL
} else if ((as.numeric(args[[1]]) < 28) & (as.numeric(args[[1]]) >= 1)) { # do not allow the sex chromosome for now
    chr_num <- as.numeric(args[[1]])
} else {
    stop("command line arguments specified wrongly, check R script")
}



### INPUT FOLDER ###
### Contains PLINK FILES, AlphaImputeLinux and Pedigree.txt ###

# on mac
#plink_geno_path <- "../sheep/data/SNP_chip/"

# on eddie, also contains the AlphaImputeLinux file and the Pedigree.txt
plink_geno_path <- "/exports/csce/eddie/biology/groups/pemberton/martin/plink_genotypes/"
####################


### OUTPUT FOLDER ###

# on mac
#output_path_chr <- paste0("all_chr_cv/chr_", chr_num)
#output_path_main_files <- paste0(output_path_chr, "/AI_main_files/")

# on eddie
output_path_chr <- paste0("/exports/eddie/scratch/v1mstoff/cv_full_1_5_sex_chr/chr_", chr_num) # main folder
output_path_main_files <-  paste0(output_path_chr, "/AI_main_files/") # main files for chr1

if (!dir.exists(output_path_chr)) dir.create(output_path_chr, recursive = TRUE)
if (!dir.exists(output_path_main_files)) dir.create(output_path_main_files)
#####################

# plink name
sheep_plink_name <- "merged_sheep_geno_ram"
# read merged plink data
sheep_bed <- paste0(plink_geno_path, sheep_plink_name, ".bed")
sheep_bim <- paste0(plink_geno_path, sheep_plink_name, ".bim")
sheep_fam <- paste0(plink_geno_path, sheep_plink_name, ".fam")
full_sample <- read.plink(sheep_bed, sheep_bim, sheep_fam)

# pseudoautosomal region SNPs
par_snps <- readLines("/exports/csce/eddie/biology/groups/pemberton/martin/plink_genotypes/RAM_PAR_SNPs_HDLD_all.txt")

# filter names of snps on one chromosome
all_chr_snps <- full_sample$map %>%  filter(chromosome == chr_num) %>%
                    dplyr::filter(!(snp.name %in% par_snps))  %>% 
                    .$snp.name

# filter those snps from full dataset and coerce from raw to numeric
sheep_geno <- as(full_sample$genotypes[, all_chr_snps], Class = "numeric")
sheep_ids <- rownames(sheep_geno)

# clear some space
rm(full_sample)

# make tibble and put rownames as ID column
sheep_geno_merged <- as_tibble(sheep_geno, rownames = "ID")

##### create spec file / has to source create_spec_file_AI.R
# this is specific to every chromosome
if (!exists("create_spec_file")) stop("Make sure create_spec_file_AI.R script is in the directory")
create_spec_file(output_path_main_files, ncol(sheep_geno_merged)-1)
#####

# which SNPs are present in the LD but not the HD SNP chip and have to be imputed?
geno_missing <- colSums(is.na(sheep_geno_merged))
# which SNPs are missing in more than 50% individuals (LD chip SNPs)
to_be_imputed <- names(geno_missing[geno_missing > 0.5 * nrow(sheep_geno_merged)])
write_lines(to_be_imputed, path = paste0(output_path_main_files,"to_be_imputed.txt"))

# AlphaImpute wants 9 instead of NA
setDT(sheep_geno_merged)
# replace NAs with 9
repl_na <- function(DT) {
    for (j in seq_len(ncol(DT)))
        set(DT,which(is.na(DT[[j]])),j,9)
}
repl_na(sheep_geno_merged)

# filter individuals which are not in pedigree due to some ID error
not_in_ped <- as.character(c(7658, 7628, 7217, 5371, -112, -6, 1791, 5986, 7717))

sheep_geno_filt <- sheep_geno_merged[!(ID %chin% not_in_ped)]

# write to file with col names for masking script
fwrite(sheep_geno_filt, paste0(output_path_main_files, "Genotypes.txt"), 
       sep = " ", col.names = TRUE)



