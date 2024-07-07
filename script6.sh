#!/bin/bash

#write a menu driven program using switch case to perform arthematic operation,test operation, command chaining

while true;
do
echo "MENU DRIVEN"
echo "enter 1 for Arthematic operation"
echo "enter 2 for test operation"
echo "enter 3 for command chaining"
read -p "enter number of your choice" choice

case $choice in
   1)echo "Arthematic operation"
    echo "a for addition"
    echo "b for substraction"
    read -p "enter 1st number" num1
    read -p "enter 2nd number" num2
    read -p "enter operator" op
    
   case $op in
     a)echo"performing addition"
      read -p "enter first number" num1
      read -p "enter second number" num2
      echo "sum is $((num1+num2))
     ;;
    b)echo "performing substraction"
     read -p "enter first number " num1
     read -p "enter second number" num2
     echo "subsctratin od number is $((num1-num2))
    ;;
   *)
   echo "invalid operator"
;;
esac
;;

  2)echo "test operation"
   echo "a for checking whether file exits or not"
   echo "b for conditional checking"
   read -p "test operation of your choice" test_op

   case $test_op in
     a)echo "for checking file is valid or not"
       read -p "enter filename" file
      if [ -e $file]
     then
     echo "file exists"
    else
    echo "file does not exist"
   fi 
  ;;
     b)echo "conditional checking"
      read -p "enter a string" str
      if [ -z $str];
      then 
      echo "the string is empty"
     else
     echo "string is non empty"
  fi
;;
*)
echo "invalid "
;;
esac
;;

3) echo "command chaining"
   echo "File operation example"
   read -p "enter directory name " dir
   mkdir $dir && (ls -ld $dir || "directory creation failed")
;;
 4)
  echo "exiting"
   break;
  ;;
*)
echo "invalid choice"
esac
done
