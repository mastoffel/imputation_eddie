#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N run_create_main_files.R
#$ -cwd
#$ -l h_rt=00:50:00
#$ -l h_vmem=8G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 5

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3

for i in {1..26}
do
   Rscript update_spec_file_in_main.R $i
done
