resource "aws_key_pair" "asg_keypairs" {
  key_name   = "asg_keypairs"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  lifecycle {
    ignore_changes = [public_key]
  }
}
