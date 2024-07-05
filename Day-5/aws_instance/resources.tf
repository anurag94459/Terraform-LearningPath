resource "aws_key_pair" "key1" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_security_group" "SG-2" {
  name        = "Sg-2"
  description = "This is security grpou"

  dynamic "ingress"  {
    for_each = "${var.port}"
    iterator = port
    content {
      description = "TLC from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }

    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  
}

resource "aws_instance" "web" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "${var.instance_type}"
  key_name = "${aws_key_pair.key1.key_name}"
  vpc_security_group_ids = ["${aws_security_group.SG-2.id}"]
  tags = {
    Name = "First-tf-instance"
  }
}

