#!/bin/bash

# URL of the word list
# URL="https://www.mit.edu/~ecprice/wordlist.10000"
URL="https://raw.githubusercontent.com/dwyl/english-words/master/words.txt"

# Output file names
OUTPUT_FILE="words_comma_separated2.txt"
FINAL_OUTPUT_FILE="final_words_list2.txt"

# Use curl to download the word list and tr to replace newlines with commas
curl $URL | tr '\n' ',' > $OUTPUT_FILE

# Remove the last comma from the file
sed '$ s/,$//' $OUTPUT_FILE > $FINAL_OUTPUT_FILE

# Cleanup intermediate file
rm $OUTPUT_FILE

echo "Comma-separated word list created in $FINAL_OUTPUT_FILE"

