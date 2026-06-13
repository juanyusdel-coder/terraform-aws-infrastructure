###############################################################
# modules/ec2/variables.tf
###############################################################

variable "project_name" { type = string }
variable "environment" { type = string }
variable "vpc_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "private_subnet_ids" { type = list(string) }
variable "instance_type" { type = string }
variable "key_name" { type = string }
variable "ami_id" { type = string }
