provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "poc-sg" {
  name = "poc-terraform-security-group"

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "tcp"
    from_port = "${var.vm_port}"
    to_port = "${var.vm_port}"
  }
}

resource "aws_instance" "poc-vm" {
  ami = "ami-0453ec754f44f9a4a"
  instance_type = "t1.micro"
  vpc_security_group_ids = ["${aws_security_group.poc-sg.id}"]
  key_name = "TRAINING"

  tags = {
    "Name" = "PoC"
  }
}
