#!/bin/bash

# Write a bash script to create a random name bucket and copy a existing file into it

# Function to generate a random string
generate_random_string() {
    cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 10 | head -n 1
}

# Generate a random bucket name
bucket_name="my-random-bucket-$(generate_random_string)"

echo "Creating S3 bucket: $bucket_name"

# Create the S3 bucket
aws s3 mb s3://$bucket_name

#copy a existing  file into the bucket 
policy_file="bucket_policy.json"

aws s3 cp $policy_file s3://$bucket_name/


