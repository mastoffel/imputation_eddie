#!/bin/bash


# extract individuals in cv_inds from the AI results files
for chr in 27
do
	for i in $(cat $1)
	do
		grep " $i "  /exports/eddie/scratch/v1mstoff/sex_chr_HMM/chr_${chr}/run_${i}/Results/ImputeGenotypesHMM.txt >> geno_imp/genos_chr_${chr}.txt

	done
done




