#!/bin/bash

# Grid Engine options can go here (always start with #$ )
#$ -N mv_runs_to_scratch
#$ -cwd
#$ -l h_vmem=20G
#$ -l h_rt=01:00:00



mv run_* /exports/eddie/scratch/v1mstoff/cv_chr1_runs/ 



