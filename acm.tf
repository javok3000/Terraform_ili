resource "aws_acm_certificate" "my_cert" {
  provider          = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"
}

resource "aws_acm_certificate_validation" "my_cert_validation" {
  provider                = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
  certificate_arn         = "${aws_acm_certificate.my_cert.arn}"
  #validation_record_fqdns = [ "${aws_route53_record.my_cert_validation.fqdn}" ]
}