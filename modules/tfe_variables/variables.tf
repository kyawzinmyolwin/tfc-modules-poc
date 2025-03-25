variable "workspace_id" {
  description = "The Terraform Cloud workspace ID"
  type        = string
}

variable "workspace_name" {
  description = "The current workspace name"
  type        = string
}

variable "target_workspace" {
  description = "The workspace name where variables should be created"
  type        = string
}

variable "vault_env_variables" {
  description = "Map of Vault environment variables"
  type        = map(string)
}
variable "sensitive_env_variables" {
  description = "Map of Vault environment variables"
  type        = map(string)
}
