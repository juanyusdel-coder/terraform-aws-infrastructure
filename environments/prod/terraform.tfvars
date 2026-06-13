# environments/prod/terraform.tfvars

project_name       = "webapp"
environment        = "prod"
aws_region         = "us-east-1"
vpc_cidr           = "10.1.0.0/16"
public_subnets     = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets    = ["10.1.3.0/24", "10.1.4.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
instance_type      = "t3.small"
key_name           = "my-key-pair"
ami_id             = "ami-0c02fb55956c7d316"
db_name            = "webappdb"
db_username        = "admin"
db_password        = "ChangeMe123!"   # Use AWS Secrets Manager in production
db_instance_class  = "db.t3.small"
