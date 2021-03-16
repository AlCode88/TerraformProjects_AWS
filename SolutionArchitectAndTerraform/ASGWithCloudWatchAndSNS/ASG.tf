################## Launch Configuration ##############################
resource "aws_launch_configuration" "Soulution_Architect_ASG" {
  name_prefix     = "Solution_launch_configuration"
  image_id        = var.AMIS[var.region]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.allow-ssh.id]
}

################## Auto Scaling Group #################################################
resource "aws_autoscaling_group" "solution_architect_ASG" {
  name                      = "solutionArchitect_ASG"
  vpc_zone_identifier       = [ aws_subnet.ASG_Public_subnet3.id, aws_subnet.ASG_Public_subnet2.id, aws_subnet.ASG_Public_subnet1.id] # need to put the subnets
  launch_configuration      = aws_launch_configuration.Soulution_Architect_ASG.name      # defined the launch configuration
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

################### Auto Scaling Policy ####################################################

################### Scale Up Alarm #########################################################

################### Auto Scaling Policy ####################################################
resource "aws_autoscaling_policy" "ASG_cpu_scaleUp_Policy" {
  name                   = "AlanCPUPolicy"
  autoscaling_group_name = aws_autoscaling_group.solution_architect_ASG.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}
################### Cloud Watch Scale Up Resource ###########################################
resource "aws_cloudwatch_metric_alarm" "CloudWatch_cpu_ScaleUp_Alarm" {
  alarm_name          = "CloudWatch_ScaleUP_CPU_Alarm"
  alarm_description   = "cloudwatch scale up alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.solution_architect_ASG.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.ASG_cpu_scaleUp_Policy.arn]
}

####################### Scale Down #######################################################

####################### Scale Down Policy ################################################
resource "aws_autoscaling_policy" "ASG_cpu_ScaleDown_Policy" {
  name                   = "ASG_cpu_scaled_down_Policy"
  autoscaling_group_name = aws_autoscaling_group.solution_architect_ASG.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

################### Cloud Watch Scale Down Resource #######################################
resource "aws_cloudwatch_metric_alarm" "CloudWatch_cpu_ScaleDown_Alarm" {
  alarm_name          = "scaledDown_metrics_Resource"
  alarm_description   = "This is cpu scaledown resource"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.solution_architect_ASG.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.ASG_cpu_ScaleDown_Policy.arn]
}

