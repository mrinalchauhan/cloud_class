#!/bin/bash

#write a bash script to update the policy file of an existing bucket

# Define the bucket name
bucket_name="abcdefgbucket123"

# Temporary policy file
policy_file="bucket_policy.json"

echo "Updating access control policy for S3 bucket: $bucket_name"

# Example policy content (replace with your actual policy)
cat <<EOF > $policy_file
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::$bucket_name/*"
        }
    ]
}
EOF

# Update the bucket policy
aws s3api put-bucket-policy --bucket $bucket_name --policy file://$policy_file

# Verify if policy update was successful
if [ $? -ne 0 ]; then
    echo "Failed to update bucket policy. Exiting."
    exit 1
fi

echo "Bucket policy updated successfully."

# Clean up: remove the temporary policy file
rm $policy_file

echo "Temporary policy file removed."

