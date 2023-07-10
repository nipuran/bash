#!/usr/bin/bash

# This bash script defines a function called "guess_the_number" 
# that generates a random number between 1 and the given argument.

# It prompts the user to guess the number and provides feedback on 
# whether the guessed number is too high, too low, or correct.

# The function continues until the user enters "q" to quit 
# or guesses the correct number.


guess_the_number ()
{
	local generated_number=$(( ($RANDOM % $1) + 1 ))

	while true; do
		echo "Guess The Number between 1 and $1 (or q to quit)"
		read guessed_number

		if [[ $guessed_number -eq "q" ]]; then
			break 
		elif [[ $guessed_number -eq $generated_number ]]; then
			echo "Congratulations! However, there is no prize for merely guessing a number."
			break 
		elif [[ $guessed_number -lt $generated_number ]]; then
			echo "Guess again; It's too low 🫵😹"
		elif [[ $guessed_number -gt $generated_number ]]; then
			echo "Guess again; It's too high 🫵😹"
		fi
	done
}

guess_the_number 10
