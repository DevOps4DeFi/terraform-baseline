## DeFi for DevOps terraform-baseline

This is a terraform module that builds out the basic resources required for other DevOps4DeFi projects.   Our code is built to be secure, and run most things in a private network, only publishing what is required to the internet via https over a load balancer.

This module builds a vpc with private and public subnets, and a ssl cert for a provided root domain, and public and private load balancers and default listeners for both these subnets.

It outputs everything you might need as an output that can be referenced somewhere else.

It's most simple usage is as follows:
```hcl-terraform
module "baseline" {
  source            = "github.com/DevOps4DeFi/terraform-baseline"
  route53_root_fqdn = var.route53_root_fqdn
}
```
where route53_root_fqdn is the fdqn of a root53 zone in the same aws account.

# terraform-docs
descriptions to be added as time/interest permits.  Feel free to contribute a pr.
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| az\_count | The number of availability zones to use.  Must be at least 2 to support load balancing. | `number` | `2` | no |
| region | AWS region to build in | `string` | `"us-east-1"` | no |
| route53\_root\_fqdn | The fqdn of a route53 zone owned by this account to build everything into | `string` | n/a | yes |
| tags | n/a | `map(string)` | <pre>{<br>  "Terraform": "true",<br>  "github_repo": "https://github.com:/DevOps4DeFi/terraform-baseline"<br>}</pre> | no |
| vpc\_cidr | The CIDR of the full VPC | `string` | `"10.69.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| all\_private\_subnets\_cidr | n/a |
| all\_public\_subnets\_cidr | n/a |
| azs | n/a |
| private\_alb\_name | n/a |
| private\_alb\_sg\_id | n/a |
| private\_lb\_https\_listener\_arn | n/a |
| private\_subnet\_cidrs | n/a |
| private\_subnet\_ids | n/a |
| public\_alb\_name | n/a |
| public\_alb\_sg\_id | n/a |
| public\_lb\_https\_listener\_arn | n/a |
| public\_subnet\_cidrs | n/a |
| public\_subnet\_ids | n/a |
| region | n/a |
| root\_domain\_acm\_arn | An ACM cert for the root domain and \*.rootdomain |
| route53\_root\_fqdn | n/a |
| vpc\_id | n/a |

