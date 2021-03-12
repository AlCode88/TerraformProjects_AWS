terraform {
  backend "s3" {
    bucket = "terraform-remote-state-alcode88"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "Terraform_State_Lock_File"
  }
}