#!/bin/sh
# Grid Engine options
#$ -N test_run_AI_split_per_chr
#$ -cwd
#$ -l h_rt=00:01:00
#$ -l h_vmem=1G
#$ -t 1-2
#$ -pe sharedmem 1


echo $SGE_TASK_ID
cd /exports/eddie/scratch/v1mstoff/all_chr_cv/chr_$SGE_TASK_ID/run_$1/
./AlphaImputeLinux
