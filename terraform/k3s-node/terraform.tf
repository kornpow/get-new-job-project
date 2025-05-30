terraform {
  backend "s3" {
    bucket = "terraform-state-hub-kornpow"
    # key            = "state/k3s-node"
    key            = "state/k3s-server-1"
    region         = "us-west-2"
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}