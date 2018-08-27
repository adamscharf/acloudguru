variable "tags" {
  description = "Default tags to always apply"
  type        = "map"

  default = {
    Owner       = "Adam Scharf"
    Email       = "scharfat@gmail.com"
    Terraform   = "true"
    Environment = "ACloudGuru"
    Module      = "tf-aws-vpc"
  }
}
