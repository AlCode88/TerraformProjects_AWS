variable "Ec2name" {
  type = string

}

resource "aws_instance" "terraformEC2" {
 instance_type = "t2.micro"
 ami = "ami-0915bcb5fa77e4892"
 tags = {
   "Name" = var.Ec2name 
 }
}

output "instance_id" {
  value = aws_instance.terraformEC2.id
}