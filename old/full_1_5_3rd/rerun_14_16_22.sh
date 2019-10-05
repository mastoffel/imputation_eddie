#!/bin/sh
# Grid Engine options
#$ -N rerun_14
#$ -cwd
#$ -l h_rt=04:00:00
#$ -l h_vmem=1.2G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=full_1_5_3rd

cd /exports/eddie/scratch/v1mstoff/$outpath/chr_22/AI_main_files
./AlphaImputeLinux

