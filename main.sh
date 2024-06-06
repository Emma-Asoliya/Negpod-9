#!/usr/bin/env bash

STUDENT_FILE="students-list_1023.txt"

create_student() {
    echo "Enter Student ID:"
    read -r id
    echo "Enter Student Name:"
    read -r name
    echo "Enter Student Email:"
    read -r email
    echo "$id,$name,$email" >> "$STUDENT_FILE"
    echo "Student record created."
}

view_students() {
    if [ -f "$STUDENT_FILE" ]; then
        echo "Student Records:"
        cat "$STUDENT_FILE"
    else
        echo "No student records found."
    fi
}

delete_student() {
    echo "Enter Student ID to delete:"
    read -r id
    if grep -q "^$id," "$STUDENT_FILE"; then
        grep -v "^$id," "$STUDENT_FILE" > temp.txt && mv temp.txt "$STUDENT_FILE"
        echo "Student record deleted."
    else
        echo "Student ID not found."
    fi
}

update_student() {
    echo "Enter Student ID to update:"
    read -r id
    if grep -q "^$id," "$STUDENT_FILE"; then
        echo "Enter new Student Name:"
        read -r name
        echo "Enter new Student Email:"
        read -r email
        grep -v "^$id," "$STUDENT_FILE" > temp.txt
        echo "$id,$name,$email" >> temp.txt
        mv temp.txt "$STUDENT_FILE"
        echo "Student record updated."
    else
        echo "Student ID not found."
    fi
}

while true; do
    echo "Select an option:"
    echo "1. Create Student Record"
    echo "2. View All Students"
    echo "3. Delete Student Record"
    echo "4. Update Student Record"
    echo "5. Exit"
    read -r option

    case $option in
        1) create_student ;;
        2) view_students ;;
        3) delete_student ;;
        4) update_student ;;
        5) echo "Exiting application."; exit ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done

