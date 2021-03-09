# Parent module
# Vpc resource
resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
}
# modules
module "any-name-module" {
    source = "../modules/child-module" #source is the only one that is required
    
}