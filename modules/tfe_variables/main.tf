

locals {
  create_variables = var.workspace_name == var.target_workspace ? var.vault_env_variables : {}
}

resource "tfe_variable" "vault_env_vars" {
  for_each    = local.create_variables
  workspace_id = var.workspace_id
  key         = each.key
  value       = each.value
  category    = "env"
  description = "Automatically managed Vault env variable."
}

locals {
  sensitive_variables = var.workspace_name == var.target_workspace ? var.sensitive_env_variables : {}
}
resource "tfe_variable" "sensitivity_env_vars" {
  for_each    = local.sensitive_variables
  workspace_id = var.workspace_id
  key         = each.key
  value       = each.value
  category    = "env"
  sensitive = true
  description = "Automatically managed Vault env variable."
}