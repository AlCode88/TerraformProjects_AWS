resource "aws_autoscaling_group" "bar" {
  name                      = "WP-ASG"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_configuration      = aws_launch_configuration.WP-launch-configuration.name
  vpc_zone_identifier       = [aws_subnet.Public-subnet-1.id, aws_subnet.public2.id,aws_subnet.public3.id]

  tag {
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "WP-launch-configuration" {
  name          = "WP-Launch_Configuration"
  image_id      = data.aws_ami.ubuntu.id #Need to provide image ID
  instance_type = "t2.micro"
}