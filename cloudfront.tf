resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.domain_name}"
}

resource "aws_cloudfront_distribution" "frontend_cloudfront" {
  origin {
    domain_name       = aws_s3_bucket.frontend_s3.bucket_regional_domain_name  # Replace with your S3 bucket's domain name
    origin_id         = aws_s3_bucket.frontend_s3.id
    s3_origin_config  { 
      
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
      
      }
  }

  viewer_certificate{
    acm_certificate_arn       = "${aws_acm_certificate_validation.my_cert_validation.certificate_arn}"
    ssl_support_method        = "sni_only"
    minimum_protocol_version  = "TLSv1.2_2021"
  }

  default_cache_behavior{
    allowed_methods        = ["GET","HEAD"]
    viewer_protocol_policy = "redirect-to-https" # other options allow-all or https-only
    target_origin_id       = aws_s3_bucket.frontend_s3.id
    cached_methods         = ["GET", "HEAD"]
  
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  comment             = var.comment_cloudfront

  aliases = var.cname

}

resource "aws_acm_certificate_validation" "my_cert_validation" {
  provider                = aws.acm_provider # because ACM needs to be used in the "us-east-1" region
  certificate_arn         = "${data.aws_acm_certificate.my_cert.arn}"
  # validation_record_fqdns = [ "${aws_route53_record.my_cert_validation.fqdn}" ]
}