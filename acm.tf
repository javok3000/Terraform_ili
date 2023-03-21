# resource "aws_acm_certificate" "my_cert" {
#   provider          = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
#   domain_name       = "${var.domain_name}"
#   validation_method = "DNS"
# }    This creates a new Certificate.

data "aws_acm_certificate" "rsa_2048" {  # Get an existant ACM.
  provider  = aws.acm_provider
  domain    = var.ilitia_domain
  key_types = ["RSA_2048"]
}

resource "aws_acm_certificate_validation" "acm_cert" {
  provider                = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
  certificate_arn         = "${data.aws_acm_certificate.rsa_2048.arn}"
  #validation_record_fqdns = [ "${aws_route53_record.acm_cert.fqdn}" ]
}