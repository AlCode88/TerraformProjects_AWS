# This is a DB Server Instance
resource "aws_instance" "db" {
 instance_type = "t2.micro"
 ami = "ami-0915bcb5fa77e4892"
 tags = {
   "Name" = "DB Server"
 }
}
# This is an output for the DB instance
output "db_privateIP" {
    value = aws_instance.db.private_ip
}