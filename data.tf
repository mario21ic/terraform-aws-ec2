data "aws_ami" "backend" {
  most_recent = true
  owners = ["${var.owner}"]

  filter {
    name   = "name"
    values = ["${var.ami_name}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

//data "aws_eip" "eip" {
//  public_ip = "${var.eip}"
//}
