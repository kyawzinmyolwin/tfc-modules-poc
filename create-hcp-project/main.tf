#First, create new Project at HCP
provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
}

resource "hcp_project" "project_name" {
  name        = "hc-siop4-org"
  description = "This is an example HCP project created with Terraform."
}


resource "hcp_service_principal" "service_principal" {
  name   = "example-sp"
  parent = hcp_project.project_name.resource_name
}

resource "hcp_service_principal_key" "key" {
  service_principal = hcp_service_principal.service_principal.resource_name
}

resource "hcp_project_iam_binding" "project_iam_binding" {
  project_id   = hcp_project.project_name.resource_id
  principal_id = hcp_service_principal.service_principal.resource_id
  role         = "roles/contributor"
}
#End of Create new Project#
resource "local_sensitive_file" "client_id" {
  content  = hcp_service_principal_key.key.client_id
  filename = "client_id"

}

resource "local_sensitive_file" "client_secret" {
  content  = hcp_service_principal_key.key.client_secret
  filename = "client_secret"
  # content_base64 = "my-client-secret"
}