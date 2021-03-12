resource "aws_dynamodb_table" "Terraform_locks" {
  name         = "Terraform_State_Lock_File"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}