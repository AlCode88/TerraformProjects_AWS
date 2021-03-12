# This is a data to read the output from the rds section. You can get the outputs of the RDS and 
# pass it to the webserver. Without having an output in the RDS we can not be able to use the value in 
# the webserver remote state resource in the webserver userdata.sh

data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
  bucket = "terraform-remote-state-alcode88"
  key    = "${var.env}/rds.tfstate"
  region = "us-east-1"
  }
}