# you need to have mfa device already existing on your machine


# 1) generate root access keys
aws configure --profile root-mfa-delete-demo 

# 2) you need to provide aws access keys, secret keys and choose the default region. 

# 3) connect ot s3 
aws s3 ls 

# 4) choose the profile that you just created
aws s3 ls --profile root-mfa-delete-demo

# 5) you need to configure the bucket name and enabled it 
aws s3api put-bucket-versioning --bucket your-bucket-name-mfa-delete-2020 --versioning-configuration Status=Enabled,MFADelete=Enabled
--mfa "arn-of-mfa-device-can-be-google-authenticator-or-any-device-and-mfa-code" --profile root-mfa-delete-demo