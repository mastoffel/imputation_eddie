#!/bin/bash

# saves only rows containing the imputed individuals to files split by chromosome
for chr in {1..26}
do
	for i in 2069 6106 6593 1881 1258 2322 1097 4741 1101 2167
	do
  		grep $i /exports/eddie/scratch/v1mstoff/cv_run_HMM_2_10_perc_hap/chr_${chr}/run_${i}/Results/ImputeGenotypeProbabilities.txt >> geno_imp/genos_chr_${chr}.txt
	done
done


