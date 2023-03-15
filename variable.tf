variable "name" {
  type        = string
  default     = "ILITIA_API_<nombre_clinica>"
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

variable subnet_ids {
  type        = list
  description = "List of subnet in default vpc"
}


