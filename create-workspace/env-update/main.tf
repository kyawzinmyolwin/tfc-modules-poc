#############################################
#Create New Workspace
#############################################

resource "tfe_workspace" "tfc_workspace" {
  name         = var.workspace_name
  organization = var.org_name

  auto_apply_run_trigger = true
  working_directory      = var.working_directory

  vcs_repo {
    identifier         = "kyawzinmyolwin/${var.repo_name}"
    oauth_token_id     = var.oauth_token_id
    branch             = var.branch # Change if using a different branch
    ingress_submodules = false

  }
}
resource "tfe_workspace_settings" "tfc_workspace" {
  workspace_id = tfe_workspace.tfc_workspace.id
  #   execution_mode = "remote"

}

resource "local_file" "workspace_id" {
  content  = tfe_workspace.tfc_workspace.id
  filename = "workspace_id"
}

module "tfe_variables" {
  source = "../../modules/tfe_variables" # Adjust path if needed
  #   workspace_id     = var.workspace_id
  #   workspace_name   = var.workspace_name
  workspace_id     = data.tfe_workspace.workspace_id.id
  workspace_name   = data.tfe_workspace.workspace_id.name
  target_workspace = data.tfe_workspace.workspace_id.name

  vault_env_variables = {

  }
  sensitive_env_variables = {
    "TFE_TOKEN" = ""
  }
}