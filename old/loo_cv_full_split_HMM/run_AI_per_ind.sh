#!/bin/sh
# Grid Engine options
#$ -N run_AI_split_per_chr
#$ -cwd
#$ -l h_rt=06:30:00
#$ -l h_vmem=5G
#$ -t 1-26
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

echo $SGE_TASK_ID
cd /exports/eddie/scratch/v1mstoff/all_chr_cv_new/chr_$SGE_TASK_ID/run_$1/
./AlphaImputeLinux
