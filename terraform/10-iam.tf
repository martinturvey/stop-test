data "aws_iam_policy_document" "lambda_assume_role" {

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lambda_ec2_stop" {

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }

  statement {
    actions = [
      "ec2:Stop*",
      "ec2:Describe*"
    ]

    resources = [
      "*",
    ]
  }
}

resource "aws_iam_role" "lambda_ec2_stop" {
  name               = "lambda_ec2_stop"
  path               = "/system/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

resource "aws_iam_policy" "lambda_ec2_stop" {
  name   = "lambda_ec2_stop"
  path   = "/"
  policy = data.aws_iam_policy_document.lambda_ec2_stop.json
}

resource "aws_iam_policy_attachment" "lambda_ec2_stop" {
  name       = "lambda_ec2_stop"
  roles      = [aws_iam_role.lambda_ec2_stop.name]
  policy_arn = aws_iam_policy.lambda_ec2_stop.arn
}
