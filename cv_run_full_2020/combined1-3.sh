#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N prep_cv
#$ -cwd
#$ -l h_rt=04:00:00
#$ -l h_vmem=5G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 4
#$ -o o_files/
#$ -e e_files/

# initialise the environment modules
. /etc/profile.d/modules.sh

module load R/3.5.3

for i in {1..26}
do
   Rscript create_main_files.R $i
done

for chr_num in {1..26}
do
        chmod u+x /exports/eddie/scratch/v1mstoff/cv_run_1_5_perc_hap/chr_$chr_num/AI_main_files/AlphaImputeLinux
done

outpath=cv_run_full_2019

for i in {1..26}
do
   cp /exports/csce/eddie/biology/groups/pemberton/martin/plink_genotypes/Pedigree.txt /exports/eddie/scratch/v1mstoff/$outpath/chr_$i/AI_main_files/
   cp /exports/csce/eddie/biology/groups/pemberton/martin/plink_genotypes/AlphaImputeLinux /exports/eddie/scratch/v1mstoff/$outpath/chr_$i/AI_main_files/
done

for i in {1..26}
do
   Rscript prep_masked_cv_runs.R $i
done
