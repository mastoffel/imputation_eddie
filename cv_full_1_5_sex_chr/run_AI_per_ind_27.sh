#!/bin/sh
# Grid Engine options
#$ -N cv_full_1_5_sex_chr
#$ -cwd
#$ -l h_rt=05:30:00
#$ -l h_vmem=1.2G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=cv_full_1_5_sex_chr

cd /exports/eddie/scratch/v1mstoff/$outpath/chr_27/run_$1
./AlphaImputeLinux
