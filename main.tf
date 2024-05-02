resource "aws_instance" "example" {
  ami           = "ami-001843b876406202a" # Specify the AMI ID of the instance
  instance_type = "t2.micro"              # Set the instance type

  tags = {
    Name = "myfirst" # Set tags for the instance
  }
}