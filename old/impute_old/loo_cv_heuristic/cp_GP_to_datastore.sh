#!/bin/bash

# Grid Engine options can go here (always start with #$ )
#$ -N mv_gp_files
#$ -cwd
#$ -q staging
#$ -l h_vmem=10G
#$ -l h_rt=01:00:00


for i in run_*
do
	cd /exports/csce/eddie/biology/groups/pemberton/martin/imputation_cv/loo_cv_heuristic/$i
	mkdir /exports/csce/datastore/biology/groups/pemberton/Martin/alpha_impute_cv/$i
	cp Results/ImputeGenotypeProbabilities.txt /exports/csce/datastore/biology/groups/pemberton/Martin/alpha_impute_cv/$i/
	cp masked_ind.txt /exports/csce/datastore/biology/groups/pemberton/Martin/alpha_impute_cv/$i/
done
