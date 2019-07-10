#!/bin/sh
# Grid Engine options
#$ -N cv_full_1_5_sex_chr
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=3G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=sex_chr_test1

cd /exports/eddie/scratch/v1mstoff/$outpath/chr_27/run_$1
./AlphaImputeLinux
