resource "aws_lb" "public_alb" {
  name               = "DevOps4DeFi-public-alb"
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.public_alb_sg.id]
  internal           = false
  tags = merge(var.tags, {Name = "DevOps4DeFi-public-alb"})
}

resource "aws_lb" "private_alb" {
  name               = "DevOps4DeFi-private-alb"
  load_balancer_type = "application"
  subnets            = module.vpc.private_subnets
  security_groups    = [aws_security_group.private_alb_sg.id]
  internal           = true
  tags = merge(var.tags, {Name = "DevOps4DeFi-private-alb"})
}

resource "aws_lb_listener" "public_https" {
  load_balancer_arn = aws_lb.public_alb.arn
  port = 443
  certificate_arn = aws_acm_certificate_validation.https.certificate_arn
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "This DevOps4DeFi provisioned public ALB is not recognizing a host it can route for.  Perhaps you are missing a listener rule?"
      status_code = "400"
    }
  }
}

resource "aws_lb_listener" "private_http" {
  load_balancer_arn = aws_lb.public_alb.arn
  port = 80
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "This DevOps4DeFi provisioned ALB is not recognizing a host it can route for.  Perhaps you are missing a listener rule?"
      status_code = "400"
    }
  }
}
### Allows all ports into public ALB from internet for easy of integration.
resource "aws_security_group" "public_alb_sg" {
  name_prefix = "DevOps4DeFi_public_alb"
  vpc_id      = module.vpc.vpc_id
  tags = merge(var.tags,{Name = "DevOps4DeFi-public-alb"})
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
  tags = merge(var.tags,{Name = "DevOps4DeFi-private-alb"})

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