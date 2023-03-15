variable "name" {
  type        = string
  default     = "ILITIA_API_<nombre_clinica>"
  description = "EC2 Name"
}

variable "elastic_ip_name" {
  type        = string
  description = "Elastic IP name"
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

variable "resource_fronted_s3" {
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
