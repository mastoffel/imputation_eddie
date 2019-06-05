library(data.table)
library(purrr)
library(parallel)

# these individuals were masked
inds <- c(2069, 6106, 6593, 1881, 1258, 2322, 1097, 4741, 1101, 2167)
#inds <- c(6106, 2069, 6593)
extract_per_chr <- function(chr, inds) {
    
    extract_ind <- function(ind) {
        file_dir <- paste0("/exports/eddie/scratch/v1mstoff/all_chr_cv/", chr, "/run_", ind)
        geno <- fread(paste0(file_dir, "/Results/ImputeGenotypeProbabilities.txt"))
        ind_geno <- geno[V1 == ind]
    }
    
    # all_inds <- data.table::rbindlist(purrr::map(inds, extract_ind))
    #cl <- makeCluster(getOption("cl.cores", 5))
    all_inds <- data.table::rbindlist(map(inds, possibly(extract_ind, data.frame(NA)), fill = TRUE))
    #stopCluster(cl)
    fwrite(all_inds, file = paste0("imputed_genotypes_new/geno_", chr, ".txt"), sep = " ", col.names = FALSE)
    
}

all_chr <- paste0("chr_", 1:17)

# save imputed individuals across all chromosomes
map(all_chr, possibly(extract_per_chr, _NA_real), inds)
