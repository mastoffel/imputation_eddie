#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N extract_imputed_inds_across_chr
#$ -cwd
#$ -l h_rt=01:00:00
#$ -l h_vmem=3G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 4

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3


 R CMD BATCH extract_inds_new.R
