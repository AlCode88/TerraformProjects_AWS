#  7 Create a Subnet with a Network Interface with an  IP in the subnet  that was created in Step 4 
resource "aws_network_interface" "terraform_network_interface" {
  subnet_id       = aws_subnet.terraform_project1_subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.terraform_project1_SG.id]
}

output "network-interface" {
  value = aws_network_interface.terraform_network_interface.id
}