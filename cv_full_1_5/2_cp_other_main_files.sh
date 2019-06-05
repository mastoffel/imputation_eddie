#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N cp_ped_and_AI
#$ -cwd
#$ -l h_rt=00:10:00
#$ -l h_vmem=0.5G
#$ -o o_files/
#$ -e e_files/

outpath=cv_full_1_5

for i in {1..26}
do
   cp /exports/csce/eddie/biology/groups/pemberton/martin/plink_genotypes/Pedigree.txt /exports/eddie/scratch/v1mstoff/$outpath/chr_$i/AI_main_files/
   cp /exports/csce/eddie/biology/groups/pemberton/martin/plink_genotypes/AlphaImputeLinux /exports/eddie/scratch/v1mstoff/$outpath/chr_$i/AI_main_files/
done
