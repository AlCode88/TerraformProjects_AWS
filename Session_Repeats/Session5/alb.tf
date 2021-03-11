# AWS Load Balancer
resource "aws_lb" "Webserver_ALB" {
  name               = "${var.env}-webserver-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ALB-SG.id]
  subnets            = data.aws_subnet_ids.Default_VPC.ids

  tags = {
    Name = "${var.env} - webserver" # Defined in variables
  }
}
# Target Group resource
resource "aws_lb_target_group" "WebserverTargetGroup" {
  name                          = "${var.env}-webserver-TargetGroup"
  port                          = 80
  protocol                      = "HTTP"
  vpc_id                        = data.aws_vpc.Default_VPC.id
  load_balancing_algorithm_type = "least_outstanding_requests" # Round Robbin Algorithm 123123
  health_check {
    path    = "/"
    port    = 80
    matcher = "404"
  }
}

# ALB Listener Resource
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.Webserver_ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.WebserverTargetGroup.arn
    type             = "forward"
  }
}

# ALB Security Group
resource "aws_security_group" "ALB-SG" {
  name        = "${var.env}-alb-WebeserverSG"
  description = "Allow http traffic"

  tags = {
    Name = "${var.env}-Alb-WebeserverSG"
  }
}

# ALB Security Group Rule 
resource "aws_security_group_rule" "http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ALB-SG.id
}
resource "aws_security_group_rule" "http_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ALB-SG.id
}
