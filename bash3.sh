#!/bin/bash
WORDS=$(cat english_words.txt)
NUMBER=1
if [[ -f "incorrect_words_german.txt" ]]; then
	rm incorrect_words_german.txt
fi
touch incorrect_words_german.txt
if [[ -f "incorrect_words_english.txt" ]]; then
	rm incorrect_words_english.txt
fi
touch incorrect_words_english.txt
for LINE in $WORDS; do
	echo $LINE
	GERMAN_WORD=$(sed -n "$NUMBER p" german_words.txt)
	ENGLISH_WORD=$(sed -n "$NUMBER p" english_words.txt)
	read USERINPUT
	if [[ $GERMAN_WORD == $USERINPUT ]]; then
		echo "correct!"
	else
		echo "incorrect!"
		echo "--> $GERMAN_WORD"
		echo "$GERMAN_WORD" >> incorrect_words_german.txt
		echo "$ENGLISH_WORD" >> incorrect_words_english.txt
	fi
	NUMBER=$(($NUMBER + 1))
done
