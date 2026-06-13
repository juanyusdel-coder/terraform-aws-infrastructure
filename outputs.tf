###############################################################
# outputs.tf — Root Outputs
###############################################################

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "ec2_public_ip" {
  description = "EC2 instance public IP"
  value       = module.ec2.ec2_public_ip
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.ec2_instance_id
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.rds_endpoint
  sensitive   = true
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.s3_bucket_name
}
