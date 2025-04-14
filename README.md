# stop-test
## Lambda to stop EC2

The Lambda checks for matching values of the 'Stop' tag in the region passed.

## Test Event

```
{
  "Stop": "group1",
  "Region": "eu-west-2"
}
```

## Instructions

An S3 backend has been defined. Please change `01-backend.tf` to an appropriate target S3 bucket.
```
cd terraform
terraform init
terraform plan
terraform apply
```

## Components

* IAM policy
* IAM role
* Lamda
