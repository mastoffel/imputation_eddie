#!/bin/sh
# Grid Engine options
#$ -N cv_full_1_5_last23
#$ -cwd
#$ -l h_rt=05:30:00
#$ -l h_vmem=1.2G
#$ -t 4-26
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=cv_full_1_5
echo $SGE_TASK_ID

cd /exports/eddie/scratch/v1mstoff/$outpath/chr_$SGE_TASK_ID/run_$1
./AlphaImputeLinux

