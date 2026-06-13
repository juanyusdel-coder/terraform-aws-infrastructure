###############################################################
# provider.tf — AWS Provider & Backend Configuration
###############################################################

terraform {
  required_version = ">= 1.10.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.50"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  backend "s3" {
    bucket  = "webapp-terraform-state-yusdel"
    key     = "webapp/terraform.tfstate"
    region  = "sa-east-1"
    encrypt = true

    # Native S3 locking — no DynamoDB needed (requires Terraform >= 1.10)
    use_lockfile = true
  }
  # Remote state backend (uncomment for team use)
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "webapp/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "terraform-lock"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "Yusdel Concepcion"
    }
  }
}
