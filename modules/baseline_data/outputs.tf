output "vpc_id" {
  value = data.terraform_remote_state.baseline.vpc_id
}
output "private_subnet_ids" {
  value = data.terraform_remote_state.baseline.private_subnets
}
output "private_subnet_cidrs" {
  value = data.terraform_remote_state.baseline.private_subnets_cidr_blocks
}
output "all_private_subnets_cidr" {
  value = data.terraform_remote_state.baseline.all_private_subnets_cidr
}
output "public_subnet_ids" {
  value = data.terraform_remote_state.baseline.public_subnets
}
output "public_subnet_cidrs" {
  value = data.terraform_remote_state.baseline.public_subnets_cidr_blocks
}
output "all_public_subnets_cidr" {
  value = data.terraform_remote_state.baseline.all_public_subnets_cidr
}
output "public_alb_name" {
  value = data.terraform_remote_state.baseline.public_alb_name
}
output "public_alb_sg_id" {
  value = data.terraform_remote_state.baseline.public_alb_sg_id
}
output "private_alb_name" {
  value = data.terraform_remote_state.baseline.private_alb_name
}
output "private_alb_sg_id" {
  value = data.terraform_remote_state.baseline.private_alb_sg_id
}
output "route53_root_fqdn" {
  value = data.terraform_remote_state.baseline.route53_root_fqdn
}
output "azs" {
  value = data.terraform_remote_state.baseline.azs
}
output "region" {
  value = data.terraform_remote_state.baseline.region
}