#!/bin/bash

#write a bash script to generate a randomized bucket name and create that bucket,upload a file in that bucket and list all content of bucket 
# and further delete the bucket and remove the file

generate_random_string() {
    cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 10 | head -n 1
}

# Generate a random bucket name
bucket_name="my-random-bucket-$(generate_random_string)"


echo "Creating S3 bucket: $bucket_name"

# Create the S3 bucket
aws s3 mb s3://$bucket_name


# create a file manually to put in the bucket the fle name is example.txt
script_file="example.txt"

# Upload script file to the S3 bucket
aws s3 cp $script_file s3://$bucket_name/

# List contents of the bucket
echo "Contents of S3 bucket $bucket_name:"
aws s3 ls s3://$bucket_name/

# Clean up: delete the bucket and script file
echo "Deleting S3 bucket $bucket_name..."
aws s3 rb s3://$bucket_name --force

# Remove the script file
rm $script_file

echo "Bucket $bucket_name and script file deleted."
