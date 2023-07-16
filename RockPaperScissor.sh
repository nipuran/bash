#!/usr/bin/bash

play() {
    echo "What's your choice? 'r' for rock, 'p' for paper, 's' for scissors"
    read -p "User: " user
    user="${user,,}"

    option=('r' 'p' 's')
    number=$(($RANDOM % 3))
    computer="${option[$number]}"
    echo "Computer: $computer"
    
    user_won=$(is_win $user $computer)

    if [[ $user == $computer ]]; then
        echo "It's a tie"
    elif [[ $user_won == "w" ]]; then
        echo "you won"
    else
        echo "you lost!"
    fi
}

# $1 = player, $2 = opponent
is_win() {
    if [[ ($1 == 'r' && $2 == 's') || ($1 == 's' && $2 == 'p') || ($1 == 'p' && $2 == 'r') ]]; then
        echo "w"
    fi
}

play