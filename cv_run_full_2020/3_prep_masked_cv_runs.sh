#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N masked_run_prep_on_scratch
#$ -cwd
#$ -l h_rt=03:00:00
#$ -l h_vmem=3G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 4
#$ -o o_files/
#$ -e e_files/

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3

for i in {1..26}
do
   Rscript prep_masked_cv_runs.R $i
done
