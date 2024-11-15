# Specify a user to log into in the AWS console

https://console.aws.amazon.com/iam/home?region=us-east-1#/users/USER

# aws cli

## Credentials

Path ~/.aws/credentials
Contains sections, [default], other profile names.

## Specify a profile

```bash
export AWS_PROFILE=PROFILE_NAME
```

or

```bash
aws --profile PROFILE_NAME
```

## S3

### List buckets

```bash
aws s3 ls
```

### Create a bucket

```bash
aws s3 mb s3://BUCKET_NAME
```

### Delete a bucket and its contents

```bash
aws s3 rm s3://BUCKET_NAME --recursive
aws s3 rb s3://BUCKET_NAME
```

Fetch a file from S3

```sh
aws s3 cp s3://BUCKET/KEY LOCAL
```
