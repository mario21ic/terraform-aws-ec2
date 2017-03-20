provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "ec2_backend" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.sg_backend.id}"]
  #availability_zone      = "${var.availability_zone}"

  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true
  iam_instance_profile   = "${var.iam_instance_profile}"

  root_block_device {
    volume_size           = "70"
    volume_type           = "gp2"
    delete_on_termination = "true"
  }

  tags {
    Name        = "ec2_${var.name}_${var.environment}"
    Class       = "ec2_${var.name}_${var.environment}"
    Enviroment  = "${var.environment}"
    Description = "Server application"
  }
}

resource "aws_security_group" "sg_backend" {
  name        = "sg_backend"
  description = "Server application inbound and outbound"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.ssh_block}"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "sg_${var.name}_${var.environment}"
    Class       = "sg_${var.name}_${var.environment}"
    Enviroment  = "${var.environment}"
    Description = "Server application security group"
  }
}
