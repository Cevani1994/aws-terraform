variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-2"
}

#Change key name with the one created in The key pairs on AWS 

variable "key_name" {
  description = "SSH keys to connect to ec2 instance"
  default     = "Donald-Terraform"
}

variable "instance_type" {
  description = "instance type for ec2"
  default     = "t2.micro"
}