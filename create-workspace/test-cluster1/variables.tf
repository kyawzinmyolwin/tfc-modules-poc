##Variables for Create Workspace##
variable "org_name" {
  default = "hc-siop2-org"
}
variable "repo_name" {
  default = "hc-siop2"
}
variable "branch" {
  default = "main"
}
variable "oauth_token_id" { # Get from Terraform Cloud VCS provider settings
  type        = string
  description = "API Toke for Github VCS"
  sensitive   = true
}

variable "workspace_name" {
  description = "Workspace Name"
  type        = string
  default     = "SecureInfraOps-Project" ### have to change WorkSpace Name
}

variable "working_directory" {
  description = "Github Working Directory"
  type        = string
  default     = "SecureInfraOps-Project" ### have to change ORG ID
}
#### End of Variables for Create Workspace ####

##Vairables for ENV Modules##
variable "workspace_id" {
  description = "Default Workspace ID jwt2"
  default     = ""
}

variable "target_workspace" {
  default = "jwt-backend"
}

