#!/bin/bash


# extract individuals in cv_inds from the AI results files
for chr in 27
do
	for i in $(cat $1)
	do
		grep " $i "  /exports/eddie/scratch/v1mstoff/cv_full_1_5_sex_chr/chr_${chr}/run_${i}/Results/ImputeGenotypes.txt >> geno_imp/genos_chr_${chr}.txt

	done
done




