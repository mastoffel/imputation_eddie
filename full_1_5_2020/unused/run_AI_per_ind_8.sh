#!/bin/sh
# Grid Engine options
#$ -N full_1_5_8
#$ -cwd
#$ -l h_rt=02:00:00
#$ -l h_vmem=20G
#$ -o o_files/
#$ -e e_files/

outpath=full_1_5_2019


cd /exports/eddie/scratch/v1mstoff/$outpath/chr_8/AI_main_files
./AlphaImputeLinux

