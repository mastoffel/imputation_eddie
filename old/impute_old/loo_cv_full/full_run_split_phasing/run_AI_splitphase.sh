#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -N alpha_impute_full_split_phasing
#$ -cwd
#$ -l h_rt=60:00:00
#$ -l h_vmem=20G
#$ -M martin.adam.stoffel@gmail.com
#$ -m beas
#$ -pe sharedmem 12


./AlphaImputeLinux
