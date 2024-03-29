variable "name" {
  type        = string
  description = "EC2 Name"
}

variable "ami" {
  type        = string
  default     = "No ami found"
  description = "AWS EC2 AMI id."

  validation{
    condition     = length(var.ami) > 4 && substr(var.ami,0,4) == "ami-"
    error_message = "Enter a valid AMI id"
  }
}

variable "instance_type" {
  type        = string
  default     = "No instance type found"
  description = "Instance EC2 type"
  sensitive   = true
}

variable "group_id" {
  type        = list
  description = "Security group"
}

variable "ssh_key" {
  type        = string
  default     = "No key pair found"
  description = "SSH key"
  sensitive   = true
}

variable "region" {
  type        = string
  default     = "No region found"
  description = "description"
}

variable "subnet_ids" {
  type        = list
  description = "List of subnet in default vpc"
}

variable "frontend_s3" {
  type        = string
  description = "Generic clinic frontend name"
}

variable "backend_s3" {
  type        = string
  description = "Generic clinic api name"
}


variable "resource_frontend_s3" {
  type        = string
  description = "Resource policy for s3"
}

variable "referer_backend_s3" {
  type        = list
  description = "AWS:Reference policy for s3"
}

variable "resource_backend_s3" {
  type        = string
  description = "Resource policy for s3"
}

variable "origin_domain" {
  type        = string
  description = "S3 Origin domain for CloudFront"
}

variable "comment_cloudfront" {
  type        = string
  description = "Description related to the clinic name"
}

variable "cname" {
  type        = list
  description = "List of CNAME for CloudFront"
}

variable "ilitia" {
  type        = string
  description = "For Route 53"
}

variable "ilitia_domain" {
  type        = string
  description = "ACM"
}

variable "api_name" {
  type        = string
  description = "Route 53 registry api name"
}

variable "front_name" {
  type        = string
  description = "Route 53 registry front name"
}

variable "cert_arn" {
  type        = string
  description = "test"
}

variable "ilitia_cache" {
  type        = string
  description = "Cache policy for Cloudfront"
}
