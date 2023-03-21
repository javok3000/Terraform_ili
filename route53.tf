data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

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