#!/bin/bash

# using script
#created a key pair
aws ec2 create-key-pair --key-name newkeypair

#creating a security group
aws ec2 create-security-group --group-name newsecuritygrp --description "newsecuritygrp"

#creating instance using the above keypair and security group
aws ec2 run-instances --image-id ami-07c8c1b18ca66bb07 --count 1 --instance-type t3.micro --key-name newkeypair --security-group-ids sg-012a51032f620e091
