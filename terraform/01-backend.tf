terraform {
  backend "s3" {
    bucket = "mct-remote-state"
    key    = "stop-test"
    region = "eu-west-2"
  }
}
