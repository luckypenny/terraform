resource "aws_security_group" "dynamic" {
  name        = "dynamic"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-08998b12f56a2e85d"

  dynamic "ingress" {
    for_each = var.ingress
    iterator = item
    content {
      description   = item.value.description
      from_port     = item.value.from_port
      to_port       = item.value.to_port
      protocol      = item.value.protocol
      cidr_blocks   = item.value.cidr_blocks
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

variable "ingress" {
  description = "list of values to assign to ingress"
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = list(string)
  }))
}