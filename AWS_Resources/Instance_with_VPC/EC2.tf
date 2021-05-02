resource "aws_instance" "aws_resource_instances" {
    ami = data.aws_ami.Amazon_linux_2.id
    subnet_id = aws_subnet.Public_subnets.0.id
    vpc_security_group_ids = [aws_security_group.aws_resource_sg.id]
    instance_type = "t2.micro"
   tags= {
     Name = "${var.env}-instance" 
   }
}