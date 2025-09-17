terragruntVersion = ">= 0.53.0"

locals {
  github_owner  = get_env("GITHUB_OWNER", "your-github-org")
  module_ref    = get_env("ZONE_MGMT_MODULE_REF", "v0.1.0")
  module_source = "git::https://github.com/cloudopsworks/terraform-module-zone-management.git//?ref=${local.module_ref}"
}

generate "provider_github" {
  path      = "provider.github.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "github" {
  owner = "${local.github_owner}"
}
EOF
}
