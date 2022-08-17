resource "aws_ssm_parameter" "sls_parameter" {
  for_each = local.parameters

  name = "/${var.env}/${var.name}/${each.key}"

  value     = each.value
  type      = "String"
  overwrite = true
}

resource "aws_ssm_parameter" "sls_global_parameter" {
  for_each = var.global_parameters

  name = "/${var.env}/global/${each.key}"

  value     = each.value
  type      = "String"
  overwrite = true
}

module "secrets" {
  source   = "hazelops/ssm-secrets/aws"
  version  = "~> 1.0"
  env      = var.env
  app_name = var.name
  names    = var.app_secrets
}

module "global_secrets" {
  source   = "hazelops/ssm-secrets/aws"
  version  = "~> 1.0"
  env      = var.env
  app_name = "global"
  names    = var.global_secrets
}
