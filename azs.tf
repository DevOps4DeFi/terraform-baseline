data "aws_availability_zones" "this" {
  state = "available"
}

locals {
  az_list = [for index in range(var.az_count) : data.aws_availability_zones.this.names[index] ]
}