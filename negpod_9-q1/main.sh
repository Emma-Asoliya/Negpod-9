#!/bin/bash

STUDENT_FILE="student-list_1023.txt"

# Function to create/add student record 
create_student_account () {
    echo "Enter your student email here:"
    read student_email
    echo "Enter your age:"
    read age
    echo "Enter your student ID here:"
    read student_ID
    echo "$student_email, $student_ID, $age" >> "$STUDENT_FILE"
    echo "Student record has been successfully added"
    echo "You have been registered as $student_email"
}

# Function to delete student record 
delete_student_account () {
    echo "Enter student ID to delete:"
    read student_ID
    if [[ -f $STUDENT_FILE ]]; then
        sed -i "/^$student_ID,/d" "$STUDENT_FILE"
        echo "Student record successfully deleted"
    else
        echo "No student record found, invalid student ID entered"
    fi
}

# Function to list all student records
list_student_accounts () {
    if [[ -f $STUDENT_FILE ]]; then
        echo "Student Records:"
        cat "$STUDENT_FILE"
    else
        echo "No student records found."
    fi
}

#Function to Update student records

update_student() {
    echo "Enter Student ID to update:"
    read student_id
    if grep -q "^$student_id," $STUDENT_FILE; then
        echo "Enter new Student Email:"
        read new_email
        echo "Enter new Student Age:"
        read new_age
        grep -v "^$student_id," $STUDENT_FILE > temp_file
        echo "$student_id,$new_email,$new_age" >> temp_file
        mv temp_file $STUDENT_FILE
        echo "Student record updated successfully!"
    else
        echo "Student ID not found!"
    fi
}

#Function to Sort Emails

sort_emails() {
    if [[ -f $STUDENT_FILE ]]; then
        cut -d',' -f2 $STUDENT_FILE | sort > sorted-student-emails.txt
        echo "Student emails sorted and saved to sorted-student-emails.txt"
    else
        echo "No student records found!"
    fi
}

# Function to display the menu
show_menu () {
    echo "===== ALU  Management System ======"
    echo "1. Add Student"
    echo "2. Delete Student"
    echo "3. List Students"
    echo "4. Update Student Record"
    echo "5. Sort Emails"
    echo "6. Exit"
    echo ""
}

# Main loop
while true; do
    show_menu
    read -p "Choose an option (1-6): " choice
    case $choice in
        1) create_student_account ;;
        2) delete_student_account ;;
        3) list_student_accounts ;;
        4) update_student ;;
	5) sort_emails ;;
	6) echo "Exiting the Student Management System. Goodbye!"; exit 0 ;;
        *) echo "Invalid option. Please enter a number between 1 and 6." ;;
    esac
    echo ""
done
