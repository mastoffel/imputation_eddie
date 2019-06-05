#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N plink_to_geno
#$ -cwd                  
#$ -l h_rt=00:45:00 
#$ -l h_vmem=8G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 12

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3

Rscript create_geno.R
