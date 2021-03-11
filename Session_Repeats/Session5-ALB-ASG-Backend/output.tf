
output "SecurityGroupName" {
  value = aws_security_group.WebserverSG.name
}

output "ami_id" {
  value = data.aws_ami.DataSource_ForAMI.id
}