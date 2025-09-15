#Storage Buckets for terraform state(remote backend)
resource "google_storage_bucket" "terraform_state" {
  name     = "${var.project_id}-${var.environment}-terraform-state"
  project  = var.project_id
  location = var.region

  #Force destroy for development (disable in production)}
  force_destroy = true

  #Enable versioning for state file safety
  versioning {
    enabled = true
  }

  #uniform bucket level access for security
  uniform_bucket_level_access = true

  #encryption at test
  #encryption {
  #  default_kms_key_name = null # We'll add KMS in Part 4
  #}

  #lifcycle management to control costs
  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "Delete"
    }
  }
  lifecycle_rule {
    condition {
      age        = 7
      with_state = "ARCHIVED"
    }
    action {
      type = "Delete"
    }
  }

  #labels for resource management
  labels = {
    environment = var.environment
    purpose     = "terraform-state"
    managed-by  = "terraform"
  }
}

#General purpose storage bucket
resource "google_storage_bucket" "app_storage" {
  name     = "${var.project_id}-${var.environment}-app-storage"
  project  = var.project_id
  location = var.region

  #storage class optimization
  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600

  }
  labels = {
    environment = var.environment
    purpose     = "application-storage"
    managed-by  = "terraform"
  }
}