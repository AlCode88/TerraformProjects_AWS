# Web_Instance Security Group
resource "aws_security_group" "aws_resource_sg" {
  vpc_id      = aws_vpc.aws_resource_vpc.id
  name        = "${var.env}-webserver_sg"
  description = "This is a web sg"

  tags = {
    Name = "${var.env}-webserver_sg"
  }
}

resource "aws_security_group_rule" "web_server_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.aws_resource_sg.id
}

resource "aws_security_group_rule" "allow_all_webserver" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.aws_resource_sg.id
}
