variable "name" {
  description = "AWS name instance"
}

variable "region" {
  description = "AWS Region"
}

variable "key_name" {
  description = "The AWS Key Pair"
}

#variable "availability_zone" {
#  description = "The AZ to start the instance in"
#}

variable "environment" {
  description = "environment"
}

variable "ami" {
  type        = "string"
  description = "AMI"
}

variable "instance_type" {
  description = "The instance type to launch"
}

variable "ssh_block" {
  type        = "list"
  description = "Allow bookingmotor server ssh connections"
}

variable "iam_instance_profile" {
  type        = "string"
  description = "iam profile"
}

# vpc variables

variable "vpc_id" {
  description = "vpc id"
}

variable "subnet_id" {
  description = "subnet id"
}
