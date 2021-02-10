resource "aws_lb" "public_alb" {
  name               = "DevOps4DeFi-public-alb"
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.public_alb_sg.id]
  internal           = false
  tags = merge(var.tags{Name = "DevOps4DeFi-public-alb"})
}

resource "aws_lb" "private_alb" {
  name               = "DevOps4DeFi-private-alb"
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.public_alb_sg.id]
  internal           = false
  tags = merge(var.tags{Name = "DevOps4DeFi-private-alb"})
}

### Allows all ports into public ALB from internet for easy of integration.
resource "aws_security_group" "public_alb_sg" {
  name_prefix = "DevOps4DeFi_public_alb"
  vpc_id      = local.vpc_id
  tags = merge(var.tags{Name = "DevOps4DeFi-public-alb"})
  ingress {
    from_port   = 0
    protocol    = "TCP"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "private_alb_sg" {
  name_prefix = "DevOps4DeFi_private_alb"
  vpc_id      = module.vpc.vpc_id
  tags = merge(var.tags{Name = "DevOps4DeFi-private-alb"})

  ingress {
    from_port   = 0
    protocol    = "TCP"
    to_port     = 0
    cidr_blocks = [local.private_cidr]
    description = "Own VPC"
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}