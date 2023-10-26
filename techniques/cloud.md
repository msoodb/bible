
# Installing AWS Command Line Interface

pip install awscli
aws --version
aws configure


## Checking for vulnerable S3 Bucket
aws s3 ls s3://[bucketname]
aws s3 ls s3://[bucketname] --no-sign-request
aws s3 mv yourfile s3://[bucketname]/test-file.txt --no-sign-request
aws s3 cp yourfile s3://[bucketname]/test-file.svg --no-sign-request
aws s3 rm s3://[bucketname]/test-file.svg --no-sign-request