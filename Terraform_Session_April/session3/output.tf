output "ec2_public_ip" {
    value = aws_instance.session3_EC2.public_ip
}

output "ec2_name" {
    value = aws_instance.session3_EC2.ami
}