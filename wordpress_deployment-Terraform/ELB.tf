resource "aws_elb" "wordpress-elb" {
  name = "Wordpress-elbs"
  security_groups  = [] # need to provide security group

  availability_zones = [ # need to define az
    # "${var.region}a", 
    # "${var.region}b",
    # "${var.region}c",
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "Wordpress-Elb"
  }
}