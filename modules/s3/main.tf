###############################################################
# modules/s3/main.tf — S3 Module
# Creates: Private S3 bucket with versioning and encryption
###############################################################

resource "aws_s3_bucket" "main" {
  bucket = "${var.project_name}-${var.environment}-assets-${random_id.suffix.hex}"

  tags = {
    Name = "${var.project_name}-${var.environment}-assets"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

# Enable Versioning
resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Lifecycle policy
resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }
}
