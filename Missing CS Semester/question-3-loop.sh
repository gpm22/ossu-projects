#!/usr/bin/env bash
echo "executing"
counter=0
 
code=0
 
output=""
error=""
while [[ "$code" -ne 1 ]]
do
	counter=$(( "$counter"+1))	
	
	./question-3-base.sh > output 2> error
	
	code="$?"
	
	if [[ "$code" -eq 1 ]]
	then
		echo "$output"
		echo "$error"
		echo "$output" > /question-3-output.txt
		echo "$error" > /question-3-error.txt
		echo "Executed $counter times until fail"
	fi
 
done