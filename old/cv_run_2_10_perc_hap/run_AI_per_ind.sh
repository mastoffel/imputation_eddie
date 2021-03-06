#!/bin/sh
# Grid Engine options
#$ -N run_AI_2_10_perc_3chr
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=5G
#$ -t 1-3
#$ -pe sharedmem 10
#$ -o o_files/
#$ -e e_files/

echo $SGE_TASK_ID

if [ $SGE_TASK_ID -eq 1 ]
then
	CHR_NUM=1
elif [ $SGE_TASK_ID -eq 2 ]
then
	CHR_NUM=14
elif [ $SGE_TASK_ID -eq 3 ]
then 	
	CHR_NUM=26
fi

cd /exports/eddie/scratch/v1mstoff/cv_run_2_10_perc_hap/chr_$CHR_NUM/run_$1/
./AlphaImputeLinux

