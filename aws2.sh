#!/bin/bash

# create a instance1
# aws ec2 run-instances --image-id ami-0705384c0b33c194c --count 1 --instance-type t3.micro --key-name ubuntukeypair --security-group-ids sg-0a60f974a08508f4d

#give ebs volume to instance1
# --block-device-mappings"[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":20,\"DeleteOnTermination\":false}}]"

#terminate instance1 
# aws ec2 terminate-instances --instance-ids i-0b19e0c42c02620cd

# create instance 2
# aws ec2 run-instances --image-id ami-0705384c0b33c194c --count 1 --instance-type t3.micro --key-name ubuntukeypair --security-group-ids sg-0a60f974a08508f4d

# add ebs volume to instance 2
# --block-device-mappings"[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":20,\"DeleteOnTermination\":false}}]"

# find out instnce d of new instance i.e instance 2
INSTANCE_ID=$( aws ec2 describe-instances --filters "Name=instance-type,Values=t3.micro" --query "Reservations[].Instances[].InstanceId")
# Display the instance ID of the new instance
echo "The instance ID of the new instance is: $INSTANCE_ID"
