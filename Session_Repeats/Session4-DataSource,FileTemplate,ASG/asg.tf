resource "aws_launch_configuration" "webserver_LaunchConfiguration" {
  name_prefix   = "${var.env}-Webserver_LaunchConfiguration"
  image_id      = data.aws_ami.DataSource_ForAMI.image_id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  user_data = data.template_file.DataSource_templateFile.rendered
  security_groups = [aws_security_group.SecurityGroup1.id]
}

resource "aws_autoscaling_group" "webserver_asg" {
  vpc_zone_identifier = data.aws_subnet_ids.Default_VPC.ids
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  force_delete = true
  launch_configuration = aws_launch_configuration.webserver_LaunchConfiguration.name

  tag {
    key                 = "Name"
    value               = "${var.env}-webserver"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}

data "aws_vpc" "Default_VPC" {
  default = true
}

data "aws_subnet_ids" "Default_VPC" {
  vpc_id = data.aws_vpc.Default_VPC.id
}