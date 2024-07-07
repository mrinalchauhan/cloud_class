#!/bin/bash

#create user
aws iam create-user \ --user-name test

#attach adminstration policy to user

aws iam attach-user-policy \ --policy-arn arn:aws:iam::aws:policy/AdministratorAccess \ --user-name test



#create iam role and create access policy 
aws iam create-role --role-name test-role  --assume-role-policy-document file://policyDoc.json

#create access policy to test-role named test policy .create access policy

aws iam create-policy --policy-name test-policy --policy-document file://accesspolicy.json

#attach role to policy
# aws iam attach-role-policy --policy-arn "arn:aws:iam::992382735832:policy/test-policy" --role-name test-role

#create user test-2
# aws iam create-user \ --user-name test2

#create a user group and add test2 and test to that group
# aws iam create-group --group-name testing

# adding test2 and test to group
# aws iam add-user-to-group --user-name test --group-name testing
# aws iam add-user-to-group --user-name test2 --group-name testing


