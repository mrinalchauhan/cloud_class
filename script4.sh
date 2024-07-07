#!/bin/bash
read -p "enter first number" a 
read -p "enter second number" b 

echo "sum is $(expr $a+$b)"
echo "substraction is $(expr $a-$b)"
echo "multiply is $(expr $a*$b)"

