provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amzn2" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "Default VPC Instance"
  instance_count = 1

  ami                         = "${data.aws_ami.amzn2.id}"
  instance_type               = "t2.micro"
  key_name                    = "personal_aws_adamscharf"
  vpc_security_group_ids      = ["sg-cc1fb6b6"]
  subnet_id                   = "subnet-7086cf28"
  associate_public_ip_address = true
  user_data                   = "${file("../../scripts/user-data.sh")}"

  tags = "${var.tags}"
}
