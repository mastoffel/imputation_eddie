#!/bin/bash

inds=$( cat ../cv_inds.txt )

for i in "${inds[@]}"
do
	echo $i
done
