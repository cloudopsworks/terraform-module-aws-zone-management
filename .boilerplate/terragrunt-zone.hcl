locals {
  root_cfg      = read_terragrunt_config(find_in_parent_folders())
  module_source = local.root_cfg.locals.module_source
}

terraform {
  source = local.module_source
}

inputs = {
  # REQUIRED: change to your product identifier
  product_name = "acme"
  # REQUIRED: change to your zone name (e.g., dev, stage, prod, shared)
  zone_name    = "prod"

  # Optional metadata
  description  = "Acme Production IaC Zone"

  # Optional tags (reserved for future use by the module)
  tags = {
    team = "platform"
  }

  extra_tags = {
    env = "prod"
  }
}
