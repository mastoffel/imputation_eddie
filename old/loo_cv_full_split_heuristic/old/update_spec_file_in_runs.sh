#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N masked_update_spec
#$ -cwd
#$ -l h_rt=00:15:00
#$ -l h_vmem=1G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas

# Initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3

for i in {1..26}
do
   Rscript update_spec_file_in_runs.R $i
done
