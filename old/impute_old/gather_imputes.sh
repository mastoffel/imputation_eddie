!#/bin/bash

# Grid Engine options can go here (always start with #$ )
#$ -N copy
#$ -cwd
#$ -l h_vmem=2G
#$ -l h_rt=00:20:00

for i in {1..99}
do
	cp run_$i/Results/ImputeGenotypeProbabilities.txt cv_results/imp_geno_run_$i
done

