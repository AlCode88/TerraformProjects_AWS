
output "SecurityGroupName" {
    value = aws_security_group.SecurityGroup1.name
}

output "ami_id" {
    value = data.aws_ami.DataSource_ForAMI.id
}