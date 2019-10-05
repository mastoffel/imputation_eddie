# foile to run lots of alpha impute runs
library(tidyverse)
library(readr)
library(data.table)

# args captures chromosome number
args <- commandArgs(trailingOnly=TRUE)
chr_num <- args[[1]]
if (purrr::is_empty(chr_num))  stop("Provide a chromosome number as argument")

outpath <- "cv_full_1_5_sex_chr"
# folder with all the files
main_files <- paste0("/exports/eddie/scratch/v1mstoff/", outpath, "/chr_", 
                     chr_num, "/AI_main_files/")
# chromosome folder
output_masked_run_to <- paste0("/exports/eddie/scratch/v1mstoff/", outpath, "/chr_", 
                        chr_num, "/")

# read full genotypes
geno_org <- fread(paste0(main_files, 'Genotypes.txt'))

# load SNPs to mask
to_be_imputed <- read_lines(paste0(main_files, 'to_be_imputed.txt'))

# cross validation for the following individuals:
# some were also in my and Bilals old runs, 2 are new.
# inds <- c(2069, 6106, 6593, 1881, 1258, 2322, 1097, 4741, 1101, 2167)
# inds <- c(2322, 1258, 1097)
inds <- as.numeric(read_lines("cv_inds.txt"))
create_cv_folder <- function(ind_num) {
    
    # directory for the AlphaImpute run with masked SNPs for one individual
    run_dir <- paste0(output_masked_run_to, "run_", ind_num)
    if (!dir.exists(run_dir)) dir.create(run_dir)

    # copy AI, pedigree and spec file over
    file.copy(from = paste0(main_files, "AlphaImputeLinux"), to =  run_dir, overwrite = TRUE)
    file.copy(from = paste0(main_files, "AlphaImputeSpec.txt"), to =  run_dir,
              overwrite = TRUE)
    file.copy(from = paste0(main_files, "Pedigree.txt"), to = run_dir, overwrite = TRUE)
    file.copy(from = paste0(main_files, "sex_chr_impute_table.txt"), to = run_dir, overwrite = TRUE) 
    # mask genotypes of 18 random individuals
    geno <- geno_org
    # impute by index, maybe change to name again at some point
    geno[ID == ind_num, to_be_imputed] <- 9
    #write_delim(geno, paste0("cv_", ind_num, "/Genotypes.txt"), delim = " ", col_names = FALSE)
    fwrite(geno, file = paste0(run_dir, "/Genotypes.txt"), sep = " ", col.names = FALSE)
    write_lines(x = ind_num, paste0(run_dir, "/masked_ind.txt"))
}

sapply(inds, create_cv_folder)



