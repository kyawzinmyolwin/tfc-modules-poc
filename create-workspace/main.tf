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