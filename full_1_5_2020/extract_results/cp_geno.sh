#!/bin/bash

for i in {1..26}
do
	cp /exports/eddie/scratch/mstoffel/full_1_5_2020/chr_$i/AI_main_files/Results/ImputeGenotypes.txt genos/ImputeGenotypes_$i.txt

done
