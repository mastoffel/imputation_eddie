#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N alpha_impute_full
#$ -cwd
#$ -l h_rt=48:00:00
#$ -l h_vmem=10G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 24

./AlphaImputeLinux
