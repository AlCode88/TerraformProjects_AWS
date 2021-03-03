# Configure the AWS Provider
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/talantburkanov/.aws/credentials"
  profile                 = "default"
}