#!/bin/bash

# saves only rows containing the imputed individuals to files split by chromosome
for chr in 6 14 26
do
	for i in 1258 2322 1097
	do
  		grep $i /exports/eddie/scratch/v1mstoff/HMM_cv_10_30_hap_3chr/chr_${chr}/run_${i}/Results/ImputeGenotypeProbabilities.txt >> geno_imp/genos_chr_${chr}.txt

	done
done


