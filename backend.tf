#local backend for initial setup
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

#After creting the storage bucket for uncomment below and migrate the state
#terraform {
#  backend "gcs" {
#    bucket = "infra-dev-472118-terraform-state"  # Replace with your GCS bucket name
#    prefix = "terraform/state"           # Optional: path within the bucket
#  }
#}  