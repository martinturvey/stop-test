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

There is a simple Github Actions defined to run a Terraform plan on push to `main`  
It has only been tested with credentials stored as repo secrets (removed following test & deactivated)  
Further development: set up OIDC to run using IAM role  

An S3 backend has been defined. Please change `01-backend.tf` to an appropriate target S3 bucket.
```
cd terraform
terraform init
terraform plan -var-file=params/default.tfvars
terraform apply -var-file=params/default.tfvars
```

## Components

* IAM policy
* IAM role
* Lamda
