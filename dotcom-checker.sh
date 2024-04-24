#!/bin/bash

# Path to the input file provided as the first argument
INPUT_FILE=$1
# Path to the output file for available domains
OUTPUT_FILE="available_domains.txt"


# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
	echo "File not found!"
	exit 1
fi

# Clear the output file or create it if it doesn't exist
> $OUTPUT_FILE


# Read the file and process each domain
IFS=, # Set comma as delimiter
while read -ra ADDR; do
    for i in "${ADDR[@]}"; do
        DOMAIN="${i}.com"
        WHOIS_OUTPUT=$(whois $DOMAIN)
	echo "Checking $DOMAIN"
        if echo $WHOIS_OUTPUT | grep -iq "No match for"; then
            echo "$DOMAIN is available" >> $OUTPUT_FILE
        fi
    done
done < "$INPUT_FILE"

echo "Check completed. Available domains are listed in $OUTPUT_FILE"

