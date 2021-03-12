# Terraform configuration
terraform {
  required_version = "~> 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.31.0"
    }
  }
}
# Providers configuration
provider "aws" {
  region = "us-east-1"
}
# SQS Resource
resource "aws_sqs_queue" "terraform_queue" {
  name = "terraform-example-queue"
}
# SNS Subscription Resource 
resource "aws_sns_topic_subscription" "sns_subscription_terraform" {
  topic_arn = data.aws_sns_topic.terraform_data.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.terraform_queue.arn
}
# DataSource for The SNS
data "aws_sns_topic" "terraform_data" {
  name = "Terraform-topic"
}