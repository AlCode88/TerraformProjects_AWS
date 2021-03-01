output "apache_public_IP" {
  value = aws_instance.terraform_apache_instance.public_ip
}

output "Elastic_IP" {
  value = aws_eip.one.public_ip
}

output "Vpc_Id" {
 value = aws_vpc.terraform_project1_vpc.id
}

output "Vpc_arn" {
 value = aws_vpc.terraform_project1_vpc.arn
}