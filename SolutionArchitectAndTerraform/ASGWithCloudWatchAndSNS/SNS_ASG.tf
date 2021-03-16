 # Uncomment if you want to have autoscaling notifications



/*
resource "aws_sns_topic" "ASG_SNS_subscription" {
  name         = "asg_sns"
  display_name = "example ASG SNS topic"
} # email subscription is currently unsupported in terraform and can be done using the AWS Web Console

resource "aws_autoscaling_notification" "asg_nofification" {
  group_names = [aws_autoscaling_group.solution_architect_ASG.name]
  topic_arn     = "${aws_sns_topic.example-sns.arn}" # you can set your own topic arn
  notifications  = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR"
  ]
}
*/