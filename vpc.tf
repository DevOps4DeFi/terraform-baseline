locals {
  private_cidr = cidrsubnet(var.vpc_cidr, 2 ,0)
  public_cidr = cidrsubnet(var.vpc_cidr, 2, 1)
  unused_cidr = cidrsubnet(var.vpc_cidr, 2 , 2)
  cidr_bits_for_azs = ciel(log( var.az_count, 2))
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.70.0"
  name = "DeFi4DevOps VPC"
  cidr = var.vpc_cidr

  azs             = local.az_list
  private_subnets = [for index in range(length(local.az_list)) : 
                      cidrsubnet(local.private_cidr, local.cidr_bits_for_azs , index )]
  public_subnets = [for index in range(length(local.az_list)) :
                      cidrsubnet(local.public_cidr, local.cidr_bits_for_azs , index )]
  enable_nat_gateway = true
  single_nat_gateway = true ## change to false for real H/A
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = merge(var.tags{Name = "DevOps4DeFi"})
}