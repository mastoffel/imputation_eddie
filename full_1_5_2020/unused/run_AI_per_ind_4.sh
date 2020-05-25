#!/bin/sh
# Grid Engine options
#$ -N full_1_5_last23
#$ -cwd
#$ -l h_rt=02:00:00
#$ -l h_vmem=2G
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

outpath=full_1_5_2019


cd /exports/eddie/scratch/v1mstoff/$outpath/chr_4/AI_main_files
./AlphaImputeLinux

