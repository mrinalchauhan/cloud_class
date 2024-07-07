
#!/bin/bash

# set vpc using bash script

# Set variables
VPC_CIDR="10.0.0.0/16"
SUBNET_CIDR="10.0.1.0/24"
INSTANCE_TYPE="t3.micro"
INSTANCE_AMI="ami-052387465d846f3fc"

# Create VPC
VPC_ID=$(aws ec2 create-vpc --cidr-block $VPC_CIDR --query 'Vpc.VpcId' --output text)
echo "VPC created: $VPC_ID"

# Create subnet
SUBNET_ID=$(aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block $SUBNET_CIDR --query 'Subnet.SubnetId' --output text)
echo "Subnet created: $SUBNET_ID"

# Create internet gateway
IGW_ID=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text)
echo "Internet gateway created: $IGW_ID"

# Attach internet gateway to VPC
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID
echo "Internet gateway attached to VPC"

# Create route table
RT_ID=$(aws ec2 create-route-table --vpc-id $VPC_ID --query 'RouteTable.RouteTableId' --output text)
echo "Route table created: $RT_ID"

# Create route in route table
aws ec2 create-route --route-table-id $RT_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID
echo "Route created in route table"

# Associate route table with subnet
aws ec2 associate-route-table --subnet-id $SUBNET_ID --route-table-id $RT_ID
echo "Route table associated with subnet"

# Launch instance into subnet
INSTANCE_ID=$(aws ec2 run-instances --image-id $INSTANCE_AMI --instance-type $INSTANCE_TYPE --subnet-id $SUBNET_ID --query 'Instances[0].InstanceId' --output text)
echo "Instance launched: $INSTANCE_ID"

# Wait for instance to become available
aws ec2 wait instance-status-ok --instance-ids $INSTANCE_ID

# Check if instance can access the internet
aws ec2 describe-instances --instance-ids $INSTANCE_ID --query 'Reservations[0].Instances[0].NetworkInterfaces[0].Association.PublicIp'
