#!/bin/bash

# saves only rows containing the imputed individuals to files split by chromosome
for chr in {1..26}
do
	for i in $(cat ../cv_inds.txt)
	do
  		grep " $i " /exports/eddie/scratch/v1mstoff/cv_run_full_2019/chr_${chr}/run_${i}/Results/ImputeGenotypes.txt >> geno_imp/genos_chr_${chr}.txt

	done
done


