#!/bin/sh
# Grid Engine options
#$ -N full_1_5_last23
#$ -cwd
#$ -l h_rt=04:00:00
#$ -l h_vmem=1.2G
#$ -t 4-26
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=full_1_5_2018
echo $SGE_TASK_ID


cd /exports/eddie/scratch/v1mstoff/$outpath/chr_$SGE_TASK_ID/AI_main_files
./AlphaImputeLinux

