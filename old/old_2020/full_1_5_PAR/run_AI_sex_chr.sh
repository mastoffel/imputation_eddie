#!/bin/sh
# Grid Engine options
#$ -N full_1_5_sex_chr
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=3G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=full_1_5_PAR

cd /exports/eddie/scratch/v1mstoff/$outpath/chr_27/AI_main_files/
./AlphaImputeLinux
