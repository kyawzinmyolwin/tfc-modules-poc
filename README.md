This is Terraform Workspace and Modules test.

### Prerequisites 
- Generate TFC Token and `terraform login` with that token.
- OAuth Token for GitHub VCS

### To Create New Workspace
- Go To the folder `create-workspace`
- run the `new_workspace.sh` and it will create the new folder.
- Run `terraform` from there.

terraform.tfvars
```
org_name = "Your HCP Org Name"

repo_name = "GitHub Repo Name"

workspace_name = "tfc-module-test-cluster1"

working_directory = "GitHub Repo Working Dir"

oauth_token_id = "xxx"
```
