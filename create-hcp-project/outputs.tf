output "client_id" {
  description = "HCP Client ID"
  value       = hcp_service_principal_key.key.client_id
}

output "client_secret" {
  description = "HCP Client ID"
  value       = hcp_service_principal_key.key.client_secret
  sensitive   = true
}