/*
This configuration will create 5 EC2 instances
on AWS provider
*/
resource "aws_instance" "web" {
  ami                         = "ami-001843b876406202a" #Ubuntu 20.04 LTS Free Tier Image
  instance_type               = "t2.micro"
  key_name                    = "keypair"
  count                       = 1
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_http_ssh.id]
  user_data                   = file("nginx.sh")
  availability_zone           = "ap-south-1a"
  associate_public_ip_address = true

  tags = {
    "Name" = "Nginx-${count.index}"
  }
}