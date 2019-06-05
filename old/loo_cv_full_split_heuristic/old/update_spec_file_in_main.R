# Script for updating the spec file


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
source("create_spec_file_AI.R")
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
} else if ((as.numeric(args[[1]]) < 27) & (as.numeric(args[[1]]) >= 1)) { # do not allow the sex chromosome for now
    chr_num <- as.numeric(args[[1]])
} else {
    stop("command line arguments specified wrongly, check R script")
}

### INPUT FOLDER ###
# for mac
# plink_geno_path <- "../sheep/data/SNP_chip/"
# for server, also contains the AlphaImputeLinux file and the Pedigree.txt
plink_geno_path <- "/exports/csce/eddie/biology/groups/pemberton/martin/plink_genotypes/"
##############

### OUTPUT FOLDER ###
# folder for chromosome
output_path_chr <- paste0("/exports/eddie/scratch/v1mstoff/all_chr_cv/chr_", chr_num)
# folder for main files for AlphaImpute run for this chromosome
output_path_main_files <-  paste0("/exports/eddie/scratch/v1mstoff/all_chr_cv/chr_", chr_num, "/AI_main_files/")

if (!dir.exists(output_path_chr)) dir.create(output_path_chr)
if (!dir.exists(output_path_main_files)) dir.create(output_path_main_files)
#############

# get low density SNP chip data and take only SNPs from chromosome 1
sheep_bed <- paste0(plink_geno_path, "20180209_SoayPlates1-83.bed")
sheep_bim <- paste0(plink_geno_path, "20180209_SoayPlates1-83.bim")
sheep_fam <- paste0(plink_geno_path, "20180209_SoayPlates1-83.fam")
ld_sample <- read.plink(sheep_bed, sheep_bim, sheep_fam)

# coerce from raw to numeric
ld_sheep_geno <- as(ld_sample$genotypes, Class = "numeric")
ld_sheep_geno[is.na(ld_sheep_geno)] <- 9
ld_sheep_geno <- as_tibble(ld_sheep_geno, rownames = "ID")

# get high density SNP chip data 
hd_sheep_bed <- paste0(plink_geno_path, "20140214_SheepHD_QC1_Polym.bed")
hd_sheep_bim <- paste0(plink_geno_path, "20140214_SheepHD_QC1_Polym.bim")
hd_sheep_fam <- paste0(plink_geno_path, "20140214_SheepHD_QC1_Polym.fam")
hd_sample <- read.plink(hd_sheep_bed, hd_sheep_bim, hd_sheep_fam)

# coerce from raw to numeric
hd_sheep_geno <- as(hd_sample$genotypes, Class = "numeric")
hd_sheep_geno[is.na(hd_sheep_geno)] <- 9
hd_sheep_geno <- as_tibble(hd_sheep_geno, rownames = "ID")

# filter, if NULL take all SNPs except for NAs and sex chromosome (which isn't in the HD chip anyway)
if (is.null(chr_num)) {
    all_chr_snps_hd <- hd_sample$map %>% filter((chromosome != 27) & (!is.na(chromosome))) %>% .$snp.name
    all_chr_snps_ld <- ld_sample$map %>% filter((chromosome != 27) & (!is.na(chromosome))) %>% .$snp.name
} else {
    all_chr_snps_hd <- hd_sample$map %>% filter(chromosome == chr_num) %>% .$snp.name
    all_chr_snps_ld <- ld_sample$map %>% filter(chromosome == chr_num) %>% .$snp.name
}

# filter genotypes
hd_sheep_geno <- hd_sheep_geno[, c("ID", all_chr_snps_hd)]
ld_sheep_geno <- ld_sheep_geno[, c("ID", all_chr_snps_ld)]

# filter individuals from ld which are in hd
ld_sheep_geno_red <- ld_sheep_geno %>% filter(!(ID %in% hd_sheep_geno$ID))

# which loci have to be imputed (which are present in HD but NOT in LD data)
to_be_imputed <- names(hd_sheep_geno)[!(names(hd_sheep_geno) %in% names(ld_sheep_geno_red))]
to_be_imputed_index <- which(!(names(hd_sheep_geno) %in% names(ld_sheep_geno_red)))

# write to files
write_lines(to_be_imputed_index, path = paste0(output_path_main_files, "to_be_imputed_index.txt"))
write_lines(to_be_imputed, path = paste0(output_path_main_files,"to_be_imputed.txt"))

rm(hd_sample)
rm(ld_sample)

# create table with both hd and ld data
#sheep_geno <- dplyr::bind_rows(hd_sheep_geno, ld_sheep_geno_red)
sheep_geno <- data.table::rbindlist(list(hd_sheep_geno, ld_sheep_geno_red), 
                                    use.names = TRUE, fill = TRUE)

# create spec file / has to source create_spec_file_AI.R
if (!exists("create_spec_file")) stop("Make sure create_spec_file_AI.R script is in the directory")
create_spec_file(output_path_main_files, ncol(sheep_geno)-1)

