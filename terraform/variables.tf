variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "key_name" {
  description = "Name of your EC2 key pair"
  default     = "mini-proj.pem"
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  default     = "Jenkins-K8s-Node"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu"
  default     = "ami-0fc5d935ebf8bc3bc"
}
