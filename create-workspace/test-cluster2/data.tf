data "tfe_workspace" "workspace_id" {
  name         = tfe_workspace.tfc_workspace.name
  organization = "hc-siop3-org"
}