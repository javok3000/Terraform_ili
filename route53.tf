resource "aws_route53_record" "api" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.api_name
  type    = "A"
  ttl     = 300
  records = [aws_eip.my_eip.public_ip]
}

resource "aws_route53_record" "front"{
    zone_id = data.aws_route53_zone.hosted_zone.zone_id
    name    = var.front_name
    type    = "A"
    #ttl     = 300
    alias   {
        name                   = aws_cloudfront_distribution.frontend_cloudfront.domain_name
        zone_id                = aws_cloudfront_distribution.frontend_cloudfront.hosted_zone_id
        evaluate_target_health = true

    }
}

# resource "aws_acm_certificate" "my_cert" {
#   provider          = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
#   domain_name       = var.domain_name
#   validation_method = "DNS"
# }

data "aws_acm_certificate" "rsa_2048" {
  provider  = aws.acm_provider
  domain    = var.domain_name
  key_types = ["RSA_2048"]
}

resource "aws_acm_certificate_validation" "my_cert_validation" {
  provider                = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
  certificate_arn         = "${data.aws_acm_certificate.rsa_2048.arn}"
  # validation_record_fqdns = [ "${aws_route53_record.my_cert_validation.fqdn}" ]
}