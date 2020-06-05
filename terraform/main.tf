terraform {
  # The latest version of Terragrunt (v0.19.0 and above) requires Terraform 0.12.0 or above.
  required_version = ">= 0.12.0"
}

locals {
  name_prefix = "${var.service}-${var.env}"
  path_prefix = "/${var.domain}/${var.service}/${var.env}/${data.aws_region.current.name}/"

  default_tags = {
    Domain  = var.domain
    Service = var.service
    Env     = var.env
    Commit  = var.commit
    Tool    = var.tool
  }
  tags = merge(local.default_tags, var.tags)
}

