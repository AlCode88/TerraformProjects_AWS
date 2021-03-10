# There is an required section in the resource that you need to specify
# For instance required part is ami and instance type.

#First instance
resource "aws_instance" "any-custom-name" {
  ami           = "ami-0915bcb5fa77e4892" # Reuired field
  instance_type = "t2.micro"              # Required field
}
