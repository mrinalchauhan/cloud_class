#!/bin/bash

# create instance and ssh into it
echo "creating instance"
aws ec2 run-instances --image-id ami-07c8c1b18ca66bb07 --count 1 --instance-type t3.micro --key-name ubuntukeypair --security-group-ids sg-07a1ec9e8fef8d827 > out.txt


echo "wait for file to be complelety written by doing below ... sleep 90 (not done here)"

#fetching the publicdns of the launched instance
instanceid=$(cat out.txt | grep "InstanceId" | awk '{print $2}' | sed 's|["",]||g' | head -n 1)
echo ${instanceid}
ip=$(aws ec2 describe-instances --instance-ids ${instanceid} | grep "PublicDnsName" |awk '{print $2}' | sed 's|["",]||g'| head -n 1)
echo ${ip}


#trying to ssh now..
echo "Starting connection script...".
ssh -i "ubuntukeypair.pem" ubuntu@"${ip}"


