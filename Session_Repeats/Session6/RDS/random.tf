# RESOURCE WHERE YOU CAN SPECIFY EVERYTHING THAT YOU WANT TO REUSE IN THE MAIN.TF 
# YOU CAN APPLY IT ANYWHERE YOU WANT. FOR MORE INFO SEE DOCUMENTATION. USAGE LINE 9 
# rds.tf file 

resource "random_password" "db_random_password" {
  length           = 16
  special          = true
  override_special = "_@%"
}