provider "aws" {
  region   = var.region
}

resource "aws_instance" "Ilitia" {
  
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_ids[0]
  key_name        = var.ssh_key
  security_groups = var.group_id

  tags = {
    Name = var.name
  }
}

resource "aws_eip" "my_eip" {
  vpc = true # Replace with `false` if you're not using a VPC
}

resource "aws_eip_association" "my_eip_association" {
  instance_id   = aws_instance.Ilitia.id
  allocation_id = aws_eip.my_eip.id
}

resource "aws_s3_bucket" "frontend_s3" {
  bucket = var.frontend_s3  # Replace with your preferred bucket name
}

resource "aws_s3_bucket_website_configuration" "frontend_s3" {
  bucket = aws_s3_bucket.frontend_s3.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
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
        Resource  = var.resource_fronted_s3
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
        Sid       = "AddPerm"
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