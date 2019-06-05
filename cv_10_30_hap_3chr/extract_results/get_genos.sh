#!/bin/bash

for i in {1..26}
do
  grep -E '^6106|^2069|^6593|^1881|^1258|^2322|^1097|^4741|^1101|^2167'  all_chr_cv/chr_$i/AI_main_files/Genotypes.txt > geno_org/genos_chr_$i.txt
done
    
