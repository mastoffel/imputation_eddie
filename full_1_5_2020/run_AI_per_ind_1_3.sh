#!/bin/sh
# Grid Engine options
#$ -N full_1_5_first3
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=3G
#$ -t 1-3
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=full_1_5_2020
echo $SGE_TASK_ID


cd /exports/eddie/scratch/mstoffel/$outpath/chr_$SGE_TASK_ID/AI_main_files
./AlphaImputeLinux

