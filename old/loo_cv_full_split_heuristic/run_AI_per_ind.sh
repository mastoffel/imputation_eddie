#!/bin/sh
# Grid Engine options
#$ -N run_AI_split_per_chr
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=3G
#$ -t 1-26
#$ -pe sharedmem 10


echo $SGE_TASK_ID
cd /exports/eddie/scratch/v1mstoff/all_chr_cv/chr_$SGE_TASK_ID/run_$1/
./AlphaImputeLinux
