# Arn address of the database
output "address" {
  value = aws_db_instance.terraform_rds.address
}

# Username of the database
output "username" {
  value = aws_db_instance.terraform_rds.username
}

# Password of the Database
output "password" {
  value     = aws_db_instance.terraform_rds.password
  sensitive = true # to hide the password or any sensitive information we can use senstive to true
}