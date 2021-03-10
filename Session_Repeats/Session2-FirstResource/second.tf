#Second instance
resource "aws_instance" "any-custom-name2" {
  ami           = "ami-0915bcb5fa77e4892" # Reuired
  instance_type = "t2.micro"              # Required field
}
