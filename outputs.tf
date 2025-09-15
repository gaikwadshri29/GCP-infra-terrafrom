output "vpc_name" {
  value       = google_compute_network.main_vpc.name
  description = "Name of the created VPC"
}

output "vpc_id" {
  value       = google_compute_network.main_vpc.id
  description = "ID of the created VPC"
}

output "vpc_self_link" {
  value       = google_compute_network.main_vpc.self_link
  description = "Self link of the VPC"
}

output "subnet_names" {
  value       = google_compute_subnetwork.main_subnet.name
  description = "Names of the created subnets"
}

output "subnet_cidrs" {
  value       = google_compute_subnetwork.main_subnet.ip_cidr_range
  description = "CIDR ranges of the created subnets"
}

output "subnet_gateway_addresses" {
  value       = google_compute_subnetwork.main_subnet.gateway_address
  description = "Gateway IP addresses subnets"
}

output "terraform_state_bucket" {
  value       = google_storage_bucket.terraform_state.name
  description = "Name of the Terraform state storage bucket"
}

output "app_storage_bucket" {
  value       = google_storage_bucket.app_storage.name
  description = "Name of the application storage bucket"
}

output "cloud_router_name" {
  value       = google_compute_router.main_router.name
  description = "Name of the Cloud Router"
}

#Network details for use in subsequent part
output "network_details" {
  value = {
    project_id  = var.project_id
    vpc_name    = google_compute_network.main_vpc.name
    subnet_name = google_compute_subnetwork.main_subnet.name
    subnet_cidr = google_compute_subnetwork.main_subnet.ip_cidr_range
    region      = google_compute_subnetwork.main_subnet.region
    #  gateway_address = google_compute_subnetwork.main_subnet.gateway_address
  }
  description = "Network Configuration details for other Terraform configurations"

}