# This is a webserver instance, line 6 as a security_groups 
# we called SG from the module moduleName + SG output in the sg folder/sg.tf
resource "aws_instance" "Webserver" {
  instance_type = "t2.micro"
  ami           = "ami-0915bcb5fa77e4892"
  user_data = file("userdata.sh")
  security_groups = [ module.sg_module.SG-group ]
  tags = {
    "Name" = "EC2 webserver"
  }
}

# This is an ouptu for the EIP module. 
# To call our module we have used module.module_nameAbove.moduleOutput in the eip/eip.tf
output "Public_IP" {
  value = module.eip_module.webserver_publicIP
}

# This is out module for the eip resource
module "eip_module" {
  source = "../eip"
  instance_id = aws_instance.Webserver.id
 }

# This is our module for the sg resource
module "sg_module" {
  source = "../sg"
}