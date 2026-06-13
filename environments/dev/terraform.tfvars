# environments/dev/terraform.tfvars

project_name       = "webapp"
environment        = "dev"
aws_region         = "sa-east-1"
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones = ["sa-east-1a", "sa-east-1b"]
instance_type      = "t3.micro"
key_name           = "my-key-pair"
ami_id             = "ami-0c51a6e57778d67c5"
db_name            = "webappdb"
db_username        = "admin"
db_password        = "Yusdel8512*"   # Use AWS Secrets Manager in production
db_instance_class  = "db.t3.micro"
