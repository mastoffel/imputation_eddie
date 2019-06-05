# file to run lots of alpha impute runs
library(dplyr)
library(readr)
library(data.table)

# folder with all the files
main_files <- "main_files_cv/"
# load genotypes
#geno_org <- read_delim(paste0(main_files, 'Genotypes_snps_in_row.txt'), delim = " ",
#                        col_types = paste0(rep("c", 45011), collapse = ""))

geno_org <- fread(paste0(main_files, 'Genotypes_snps_in_row.txt'))

# load SNPs to mask
to_be_imputed <- read_lines(paste0(main_files, 'to_be_imputed.txt'))


create_cv_folder <- function(run_num) {
    
    cv_dir <- paste0("run_", run_num)
    if (dir.exists(cv_dir)) stop("cv directories already exist and have to be deleted")
    dir.create(cv_dir)
    file.copy(from = paste0(main_files, "AlphaImputeLinux"), to = paste0("run_", run_num))
    file.copy(from = paste0(main_files, "AlphaImputeSpec.txt"), to = paste0("run_", run_num),
              overwrite = TRUE)
    file.copy(from = paste0(main_files, "Pedigree.txt"), to = paste0("run_", run_num))
    
    # mask genotypes of 18 random individuals
    geno <- geno_org
    # set seed to know which individuals
    set.seed(123 + run_num)
    ind_to_mask <- sample(1:188, 1)
    geno[ind_to_mask, to_be_imputed] <- 9
    #write_delim(geno, paste0("run_", run_num, "/Genotypes.txt"), delim = " ", col_names = FALSE)
    fwrite(geno, file = paste0("run_", run_num, "/Genotypes.txt"), sep = " ", col.names = FALSE)
    write_lines(x = geno$ID[ind_to_mask], paste0("run_", run_num, "/masked_ind.txt"))
}

sapply(1:50, create_cv_folder)



