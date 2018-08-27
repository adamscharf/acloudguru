output "ids" {
  description = "List of IDs of instances"
  value       = "${module.ec2_public.id}"
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = "${module.ec2_public.public_dns}"
}

output "vpc_security_group_ids" {
  description = "List of VPC security group ids assigned to the instances"
  value       = "${module.ec2_public.vpc_security_group_ids}"
}

output "tags" {
  description = "List of tags"
  value       = "${module.ec2_public.tags}"
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = "${module.ec2_public.id[0]}"
}

# output "instance_public_dns" {
#   description = "Public DNS name assigned to the EC2 instance"
#   value       = "${module.ec2_public.public_dns[0]}"
# }

output "credit_specification_t2_unlimited" {
  description = "Credit specification of t2-type EC2 instance"
  value       = "${module.ec2_public.credit_specification}"
}

output "instance_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${module.ec2_public.public_ip}"]
}
