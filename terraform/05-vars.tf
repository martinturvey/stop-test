variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "lambda_runtime" {
  type    = string
  default = "python3.10"
}

variable "lambda_timeout" {
  type    = number
  default = 30
}
