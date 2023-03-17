data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

data "aws_acm_certificate" "my_cert" {
  provider          = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
  domain            = var.domain_name
  # validation_method = "DNS"
}