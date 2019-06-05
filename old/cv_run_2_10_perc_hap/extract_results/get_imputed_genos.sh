#!/bin/bash

# saves only rows containing the imputed individuals to files split by chromosome
for chr in 1 14 26
do
	for i in 2322 1258 1097
	do
  		grep $i /exports/eddie/scratch/v1mstoff/cv_run_2_10_perc_hap/chr_${chr}/run_${i}/Results/ImputeGenotypeProbabilities.txt >> geno_imp/genos_chr_${chr}.txt
	done
done


