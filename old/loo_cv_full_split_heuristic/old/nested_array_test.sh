#!/bin/bash

for i in $(cat cv_inds_test.txt); do
        echo $i
        qsub run_AI_per_ind_test.sh $i
done
