resource "aws_s3_bucket" "frontend_s3" {
  bucket = var.frontend_s3  # Replace with your preferred bucket name
}

resource "aws_s3_bucket_website_configuration" "frontend_s3" {
  bucket = aws_s3_bucket.frontend_s3.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "frontend_policy" {
  bucket = aws_s3_bucket.frontend_s3.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AddPerm"
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = var.resource_frontend_s3
      }
    ]
  })
}

resource "aws_s3_bucket" "backend_s3" {
  bucket = var.backend_s3
}

resource "aws_s3_bucket_policy" "backend_policy" {
  bucket = aws_s3_bucket.backend_s3.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "Statement1"
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = var.resource_backend_s3,
        Condition = {
          StringNotEquals = {
            "aws:Referer": var.referer_backend_s3
          }
        }
      }
    ]
  })
}