library(data.table)
library(purrr)
extract_imputed_inds <- function(run_num) {
    
    file_dir <- paste0("run_", run_num)
    
    if (dir.exists(paste0(file_dir, "/Results"))) {
        if (file.exists(paste0(file_dir, "/Results/ImputeGenotypeProbabilities.txt"))) {
            
            masked_ind <- readLines(paste0(file_dir, "/masked_ind.txt"))
            geno <- fread(paste0(file_dir, "/Results/ImputeGenotypeProbabilities.txt"))
            ind_geno <- geno[V1 == masked_ind]
            
        }
    }
    
}

# put number of folders in here:
all_imputed <- map(41:50, extract_imputed_inds)
all_df <- rbindlist(all_imputed)

fwrite(all_df, file = "all_imputed_inds.txt", sep = " ", col.names = FALSE)
