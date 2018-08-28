provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  enable_dns_hostnames             = true

  tags = "${merge(
    var.tags,
    map(
        "Name", "Main VPC"
    )
  )}"
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = "${merge(
    var.tags,
    map(
        "Name", "Private Subnet"
    )
  )}"
}

resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = "${merge(
    var.tags,
    map(
        "Name", "Public Subnet"
    )
  )}"
}

resource "aws_security_group" "web" {
  name        = "Web SG"
  description = "Allow public inbound traffic for HTTP, HTTPS, and SSH"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "HTTPS"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "SSH"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "All Outbound Traffic"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(
    var.tags,
    map(
        "Name", "Web SG"
    )
  )}"
}

resource "aws_security_group" "private" {
  name        = "Private SG"
  description = "Allow private inbound traffic for SSH and egress via NAT GW"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    description     = "Private SSH"
    security_groups = ["${aws_security_group.web.id}"]
  }

  ingress {
    from_port       = "-1"
    to_port         = "-1"
    protocol        = "icmp"
    description     = "All private ICMP"
    security_groups = ["${aws_security_group.web.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "All Outbound Traffic"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${merge(
    var.tags,
    map(
        "Name", "Private SG"
    )
  )}"
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags = "${merge(
    var.tags,
    map(
        "Name", "Main IGW"
    )
  )}"
}

resource "aws_eip" "nat_gw" {
  depends_on = ["aws_internet_gateway.main"]
  vpc        = true

  tags = "${merge(
    var.tags,
    map(
        "Name", "NAT GW Elastic IP"
    )
  )}"
}

resource "aws_nat_gateway" "gw" {
  subnet_id     = "${aws_subnet.public.id}"
  allocation_id = "${aws_eip.nat_gw.id}"

  tags = "${merge(
    var.tags,
    map(
        "Name", "NAT GW"
    )
  )}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = "${merge(
    var.tags,
    map(
        "Name", "Public Route Table"
    )
  )}"

  depends_on = ["aws_internet_gateway.main"]
}

resource "aws_default_route_table" "default" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.gw.id}"
  }

  tags = "${merge(
    var.tags,
    map(
        "Name", "Default Route Table"
    )
  )}"

  depends_on = ["aws_internet_gateway.main"]
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

data "aws_ami" "amzn2" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "ec2_public" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "Main VPC - Public"
  instance_count = 1

  ami                         = "${data.aws_ami.amzn2.id}"
  instance_type               = "t2.micro"
  key_name                    = "personal_aws_adamscharf"
  vpc_security_group_ids      = ["${aws_security_group.web.id}"]
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  user_data                   = "${file("../../scripts/user-data.sh")}"

  tags = "${var.tags}"

  # depends_on = ["aws_internet_gateway.gw"]
}

module "ec2_private" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "Main VPC - Private"
  instance_count = 1

  ami                    = "${data.aws_ami.amzn2.id}"
  instance_type          = "t2.micro"
  key_name               = "personal_aws_adamscharf"
  vpc_security_group_ids = ["${aws_security_group.private.id}"]
  subnet_id              = "${aws_subnet.private.id}"

  tags = "${var.tags}"
}
