provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/Users/adam/.aws/credentials"
  profile                 = "AdamScharf"
}

terraform {
  backend "s3" {
    bucket  = "adamscharf"
    key     = "terraform_state/acloudguru/lifecycle_rules.tfstate"
    region  = "us-east-1"
    profile = "AdamScharf"
  }
}

variable "tags" {
  type = "map"

  default = {
    owner       = "Adam Scharf"
    email       = "scharfat@gmail.com"
    project     = "Solution Architect Associate Exam"
    environment = "dev"
  }
}

resource "aws_s3_bucket" "lifecycle_rules" {
  bucket_prefix = "lifecycle-rules-"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 425
    }
  }

  tags = "${merge(
    var.tags,
    map(
        "foo", "bar",
        "environment", "test"
    )
  )}"
}
