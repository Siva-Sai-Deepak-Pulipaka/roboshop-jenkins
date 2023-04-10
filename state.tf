terraform {
  backend "s3" {
    bucket = "easydevops"
    key = "jenkins/terraform.tfstate"
    region = "us-east-1"

  }
}
