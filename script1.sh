#!/bin/bash

# write a bash script to check the free space in disk space . if free space is less than 60 display message "memory low"
alert=60
free_space=$(df -h "/"| grep -wo "[0-9]*")

# checking if free space is greater than 40
if [[$(free_space) -gt $(alert)]]:
then
echo "memory sufficient"
else
echo "memory low"
fi



