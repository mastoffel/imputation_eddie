#!/bin/bash

for i in {1..26}
do
	cp /exports/eddie/scratch/v1mstoff/full_1_5/chr_$i/AI_main_files/Results/ImputeGenotypeProbabilities.txt ./ImputeGenotypeProbabilities_$i.txt
done
