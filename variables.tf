variable "project_id" {
  type        = string
  description = "The ID of the project to use for the resources"
  validation {
    condition     = length(var.project_id) > 6
    error_message = "The project ID must be at least 6 characters long"
  }
}

variable "region" {
  type        = string
  description = "The region to use for the resources"
  default     = "us-central1"
  validation {
    condition     = contains(["us-central1", "us-east1", "us-west1", "europe-west1", "asia-east1"], var.region)
    error_message = "The region must be at least 3 characters long"
  }
}

variable "environment" {
  type        = string
  description = "The environment to use for the resources"
  default     = "dev"
  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "The environment must be either dev or prod"
  }
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC to use for the resources"
  default     = "main-vpc"

}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet to use for the resources"
  default     = "main-subnet"
}

variable "subnet_cidr" {
  type        = string
  description = "The CIDR block of the subnet to use for the resources"
  default     = "10.0.1.0/24"
  validation {
    condition     = can(cidrhost(var.subnet_cidr, 0))
    error_message = "The subnet CIDR block must be a valid CIDR block"
  }
}