#!/bin/sh
# Grid Engine options
#$ -N cv_AI_par
#$ -cwd
#$ -l h_rt=04:00:00
#$ -l h_vmem=1.2G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=PAR

cd /exports/eddie/scratch/v1mstoff/$outpath/chr_27/run_$1
./AlphaImputeLinux
