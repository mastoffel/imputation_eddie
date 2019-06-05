#!/bin/sh
# Grid Engine options
#$ -N run_AI_HMM_2_10
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=5G
#$ -t 1-26
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

echo $SGE_TASK_ID
cd /exports/eddie/scratch/v1mstoff/cv_run_HMM_2_10_perc_hap/chr_$SGE_TASK_ID/run_$1/
./AlphaImputeLinux

