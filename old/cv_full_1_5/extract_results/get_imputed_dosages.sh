#!/bin/bash


# extract individuals in cv_inds from the AI results files
for chr in {1..26}
do
	for i in $(cat $1)
	do
		grep " $i "  /exports/eddie/scratch/v1mstoff/cv_full_1_5/chr_${chr}/run_${i}/Results/ImputeGenotypeProbabilities.txt >> geno_imp/genos_chr_${chr}.txt
	done
done




