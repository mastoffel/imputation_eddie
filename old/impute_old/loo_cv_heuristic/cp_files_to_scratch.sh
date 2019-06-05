#!/bin/sh


# Grid Engine options can go here (always start with #$ )
#$ -N mv_files
#$ -cwd
#$ -l h_vmem=10G
#$ -l h_rt=01:00:00


for runnum in {1..50}
do
	cd /exports/csce/eddie/biology/groups/pemberton/martin/imputation_cv/loo_cv_heuristic/run_$runnum/Results/
	mkdir /exports/eddie/scratch/v1mstoff/cv_run/run_$runnum/
	mv ImputePhaseProbabilities.txt WellPhasedIndividuals.txt ImputePhase.txt ModelRecomb.txt /exports/eddie/scratch/v1mstoff/cv_run/run_$runnum/
done
