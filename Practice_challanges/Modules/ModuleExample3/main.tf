# Terraform configuration file
terraform {
  required_version = "~> 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.25.0"
    }
  }
}

module "eip-module" {
  source = "./eip"
}

module "igw-module" {
  source = "./igw"
}

module "network_interface-module"{
  source = "./network_interface"
}

module "route_table-module" {
  source = "./route-table"
}

module "sg-module" {
  source = "./sg"
}

module "subnet-module" {
  source = "./subnet"
}

module "vpc-module" {
  source = "./vpc"
}

module "web-module" {
  source = "./web"
}