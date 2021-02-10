output "vpc_id" {
  value = module.vpc.vpc_id
}
output "private_subnet_ids" {
  value = module.vpc.private_subnets
}
output "private_subnet_cidrs" {
  value = module.vpc.private_subnets_cidr_blocks
}
output "all_private_subnets_cidr" {
  value = local.private_cidr
}
output "public_subnet_ids" {
  value = module.vpc.public_subnets
}
output "public_subnet_cidrs" {
  value = module.vpc.public_subnets_cidr_blocks
}
output "all_public_subnets_cidr" {
  value = local.public_cidr
}
output "public_alb_name" {
  value = aws_lb.public_alb.name
}
output "public_alb_sg_id" {
  value = aws_security_group.public_alb_sg.id
}
output "private_alb_name" {
  value = aws_lb.private_alb.name
}
output "private_alb_sg_id" {
  value = aws_security_group.private_alb_sg.id
}
output "route53_root_fqdn" {
  value = data.aws_route53_zone.rootzone.name
}
output "azs" {
  value = local.az_list
}
output "region" {
  value = var.region
}

output "root_domain_acm_arn" {
  value = aws_acm_certificate_validation.https.certificate_arn
  description = "An ACM cert for the root domain and *.rootdomain"
}

output "private_lb_http_listener_arn" {
  value = aws_lb_listener.private_http.arn
}

output "public_lb_https_listener_arn" {
  value = aws_lb_listener.public_https.arn
}