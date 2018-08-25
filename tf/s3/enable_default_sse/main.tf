provider "aws" {
  region  = "us-east-1"
  profile = "AdamScharf"
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

resource "aws_s3_bucket" "standard_s3_bucket" {
  bucket_prefix = "standard-s3-"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
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
