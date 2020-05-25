#!/bin/sh
# Grid Engine options
#$ -N cv_full_1_5_first3
#$ -cwd
#$ -l h_rt=06:00:00
#$ -l h_vmem=3G
#$ -t 1-3
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=cv_run_full_2020
echo $SGE_TASK_ID


cd /exports/eddie/scratch/mstoffel/$outpath/chr_$SGE_TASK_ID/run_$1
./AlphaImputeLinux

