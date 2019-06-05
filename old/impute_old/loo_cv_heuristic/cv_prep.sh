#!/bin/bash

#$ -N cv
#$ -cwd
#$ -M martin.adam.stoffel@gmail.com
#$ -l h_rt=2:30:00
#$ -l h_vmem=20G

. /etc/profile.d/modules.sh

module load R

Rscript /exports/csce/eddie/biology/groups/pemberton/martin/imputation_cv/loo_cv_heuristic/imputation_prep.R

