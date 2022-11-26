provider "aws" {
  region     = "ap-northeast-2"
}

resource "aws_instance" "example" {
  ami                         = "ami-0eddbd81024d3fbdd"
  instance_type               = "t3.micro"
  key_name                    = "mydemokey"
  # user_data                   = "${file("${var.user-data-script}")}"
  # user_data                   = "${var.user-data-script != "" ? file("${var.user-data-script}") : ""}"
  # vpc_id                      = "vpc-08998b12f56a2e85d"
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = "subnet-09268ba967fab1a90"

  tags = {
    Name = "my ec2"
  }
}

resource "aws_security_group" "sg" {
  name = "mysg"
  vpc_id = "vpc-08998b12f56a2e85d"
  
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    to_port     = "22"
  }

  egress {
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    to_port     = "0"
  }

  tags = {
    Name = "sg-tag"
  }
}