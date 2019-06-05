#!/bin/bash

for i in {1..99}
do
  	cp run_$i/Results/ImputeGenotypeProbabilities.txt cv_results/imp_geno_run_$i
done
