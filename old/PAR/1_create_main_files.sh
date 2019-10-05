#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N par_create_main_files.R
#$ -cwd
#$ -l h_rt=10:00:00
#$ -l h_vmem=10G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 2
#$ -o o_files/
#$ -e e_files/

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3

for i in 27
do
   Rscript create_main_files_sexchr.R $i
done


