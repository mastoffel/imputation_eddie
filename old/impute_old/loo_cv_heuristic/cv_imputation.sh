#!/bin/bash

# Grid Engine options
#$ -t 1-50
#$ -cwd
#$ -M martin.adam.stoffel@gmail.com
#$ -l h_vmem=15G
#$ -l h_rt=08:00:00
#$ -pe sharedmem 10

cd /exports/csce/eddie/biology/groups/pemberton/martin/imputation_cv/loo_cv_heuristic/run_$SGE_TASK_ID
./AlphaImputeLinux

