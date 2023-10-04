terraform {
  backend "s3" {
    bucket         = "terraform-state-hub-kornpow"
    key            = "state/security"
    region         = "us-west-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}