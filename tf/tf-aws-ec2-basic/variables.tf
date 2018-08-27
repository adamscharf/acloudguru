variable "tags" {
  description = "Default tags to always apply"
  type        = "map"

  default = {
    owner       = "Adam Scharf"
    email       = "scharfat@gmail.com"
    Terraform   = "true"
    Environment = "ACloudGuru"
    Module      = "tf-aws-ec2-basic"
  }
}
