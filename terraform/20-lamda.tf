data "archive_file" "lambda" {
  type        = "zip"
  source_file = "../python/ec2_stop.py"
  output_path = "ec2_stop_payload.zip"
}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "ec2_stop_payload.zip"
  function_name = "ec2_stop"
  role          = aws_iam_role.lambda_ec2_stop.arn
  handler       = "ec2_stop.lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.10"
  timeout = 10
}
