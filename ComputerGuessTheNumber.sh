#!/usr/bin/bash

computer_guess_the_number() {
	low=1
	high=$1
	echo "Which number would you like the computer to guess, between 1 and $high?"
	read number

	while true; do
		if [[ $high -ne $low ]]; then
			guess=$((  $RANDOM % ( $high - $low + 1 ) + $low ))
		else
			echo "OK, Computer guessed the number!!"
            break
		fi

		if [[ $guess -eq  $number ]]; then
			echo "OK, Computer guessed the number!!!"
            break
		fi

		echo "Is $guess too high (H), too low (L)?"
		read feedback 
		feedback="${feedback,,}"

		case "$feedback" in
			"h")
				high=$(($guess - 1))
			;;
			"l")
				low=$(($guess + 1))
			;;
		esac
	done
}

computer_guess_the_number 10