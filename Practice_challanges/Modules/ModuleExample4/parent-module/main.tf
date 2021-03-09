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