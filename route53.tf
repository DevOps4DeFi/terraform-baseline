data "aws_route53_zone" "rootzone" {
  name = var.route53_root_fqdn
}
