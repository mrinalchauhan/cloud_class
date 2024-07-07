#!/bin/bash

# write a bash script to host a static website in s3..the html page of the website is added in the bucket and then polict file is added ..all using script

# Replace with your desired bucket name and website directory
bucket_name="abcdxyz12345"
website_dir="home/iteradmin/index2.html"

# Step 1: Create S3 bucket
echo "Creating S3 bucket: $bucket_name"
aws s3 mb s3://$bucket_name

# Step 2: Enable static website hosting
echo "Configuring static website hosting for bucket: $bucket_name"
aws s3 website s3://$bucket_name/ --index-document index.html --error-document error.html

# Step 3: Sync website files to S3 bucket
echo "Uploading website files to S3 bucket: $bucket_name"
aws s3 sync $website_dir s3://$bucket_name/

# Step 4: Set bucket policy to allow public read access
policy_file="bucket_policy.json"
echo "Setting bucket policy to allow public read access"
cat <<EOF > $policy_file
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::$bucket_name/*"
        }
    ]
}
EOF

aws s3api put-bucket-policy --bucket $bucket_name --policy file://$policy_file

# Step 5: Display website endpoint
website_endpoint=$(aws s3api get-bucket-website --bucket $bucket_name --query 'Endpoint' --output text)
echo "Website URL: http://$bucket_name.s3-website-$(aws configure get region).amazonaws.com"



echo "Static website hosted successfully."
