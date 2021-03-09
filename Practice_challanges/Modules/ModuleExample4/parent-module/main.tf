# Parent module
# Vpc resource
resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
}
# you need to always run terraform init whenever you make a changes
# on your module. 
#Need to be in the parent directory or file to run terraform init

module "any-name-module" {
    #source is the only one that is required
    source = "../modules/child-module" 
    #all the followings are coming from the modules/child-module/variables.tf
    vpc = aws_vpc.main.id        
    cidr_block = "10.0.0.0/16"
    ami = "ami-047a51fa27710816e"
    instance_type = "t2.medium"
    webserver_name = "test"
}

# you can specify multiple modules inside the parent module
/*
Example how to set to the different region you need different providers file

provider "aws" {
  alias = "east"
  region = "us-west-1"
}

*/
/*
Another Module for different region
module "any-name-module-east" {
    source = "../modules/child-module"
    providers = {
      aws = aws.east
  }
    vpc = aws_vpc.main.id        
    cidr_block = "10.0.0.0/16"
    ami = "ami-047a51fa27710816e" #ami is restricted to the region
    instance_type = "t2.medium"
    webserver_name = "test"
}
*/

output "instance_data" {
    value = module.any-name-module.instance
}

/*
 This is how you use the output of the resource
 module - module/name - intance (the output name in the childmodule/outputs.tf file)

resource "aws_elb" "main" {
     instances = module.any-name-module.instance.id
   }
*/