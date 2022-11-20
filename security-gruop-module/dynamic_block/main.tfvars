ingress = [ 
  {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["1.1.1.0/24"]
  }, 
  {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["1.1.1.0/24"]
  },
  {
    description      = ""
    from_port        = 9999
    to_port          = 9999
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
]