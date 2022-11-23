#!/bin/bash
WORDS=$(cat incorrect_words_english.txt)
NUMBER=1
for LINE in $WORDS; do
	echo $LINE
	GERMAN_WORD=$(sed -n "$NUMBER p" incorrect_words_german.txt)
	ENGLISH_WORD=$(sed -n "$NUMBER p" incorrect_words_english.txt)
	read USERINPUT
	if [[ $GERMAN_WORD == $USERINPUT ]]; then
		echo "correct!"
	else
		echo "incorrect!"
		echo "--> $GERMAN_WORD"
	fi
	NUMBER=$(($NUMBER + 1))
done
