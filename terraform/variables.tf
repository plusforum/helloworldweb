variable "instance_name" {
  description = "Value of the EC2 instance's Name tag."
  type        = string
  default     = "terraform_instance"
}

variable "instance_type" {
  description = "The EC2 instance's type."
  type        = string
  default     = "t3.small"
}

variable "region" {
  description = "AWS region for resources"
  type = string
  default = "ap-south-1"
}
