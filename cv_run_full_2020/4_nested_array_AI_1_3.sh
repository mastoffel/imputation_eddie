#!/bin/bash

for i in $(cat cv_inds.txt); do
	echo $i
	qsub run_AI_per_ind_1_3.sh $i
done
