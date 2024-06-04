#!/bin/bash

FILE="students-list_1023.txt"
OUTPUT_FILE="student-emails.txt"

if [[ -f $FILE ]]; then
    # Extract the second field (email) from each line and save it to the output file
    cut -d',' -f2 $FILE > $OUTPUT_FILE
    echo "Student emails have been saved to $OUTPUT_FILE"
else
    echo "No records found."
fi

