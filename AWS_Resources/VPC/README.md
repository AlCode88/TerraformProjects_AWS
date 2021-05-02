# VPC (Virtual Private Cloud/Network)
![vpc_diagram](../extras/file1.png)
## VPC
VPC isolates the instances on a network level.
 - It is like your own private network.

Best Practice is to always launch your instance in a VPC.
 - the default VPC
 - or your create one using terraform


**Note:** There is also EC2-Classic, which is basically one big network where all AWS customers could launch their instances in it is one big network but the best practice is to launch the instances in your own VPC.

An instance launched in one VPC can never communicate with an instance in another VPC using their **private IP address**.
- They could communicate still, but using their public IP (not recommended)

## VPC Peering
Is the VPC component of VPC that links 2 VPCs together. And you can make your resources to talk to each other like they are in the same VPC.
