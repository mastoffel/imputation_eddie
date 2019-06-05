#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N cv_1_5_full_run_create_main_files.R
#$ -cwd
#$ -l h_rt=30:00:00
#$ -l h_vmem=8G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 4
#$ -o o_files/
#$ -e e_files/

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3

for i in {18..26}
do
   Rscript create_main_files.R $i
done


