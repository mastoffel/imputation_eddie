#!/bin/sh
# Grid Engine options
#$ -N full_1_5_last23
#$ -cwd
#$ -l h_rt=04:00:00
#$ -l h_vmem=1.2G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=full_1_5_2020
echo $SGE_TASK_ID


cd /exports/eddie/scratch/mstoffel/$outpath/chr_13/AI_main_files
./AlphaImputeLinux

