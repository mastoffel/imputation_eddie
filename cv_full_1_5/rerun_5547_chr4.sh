#!/bin/sh
# Grid Engine options
#$ -N cv_full_rerun_single
#$ -cwd
#$ -l h_rt=06:00:00
#$ -l h_vmem=1.2G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=cv_full_1_5

cd /exports/eddie/scratch/v1mstoff/$outpath/chr_4/run_5547
./AlphaImputeLinux

