#!/usr/bin/env bash
echo "executing"
counter=0
 
code=0

echo ""> ./question-3-output.txt
echo ""> ./question-3-error.txt
 
while [[ "$code" -ne 1 ]]
do
	counter=$(( "$counter"+1))	
	
	./question-3-base.sh >> ./question-3-output.txt 2> ./question-3-error.txt
	
	code="$?"
	
	if [[ "$code" -eq 1 ]]
	then
		
		echo "Executed $counter times until fail" >> ./question-3-output.txt
		
		cat  ./question-3-output.txt ./question-3-error.txt 
	fi
 
done