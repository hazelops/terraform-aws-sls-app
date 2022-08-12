locals {
  parameters = merge(var.parameters,
    {
      // TODO: With TF 1.13 upgrade switch to module for_each

      vpc_id          = var.vpc_id
      private_subnet_1 = var.private_subnets[0]
      private_subnet_2 = var.private_subnets[1]
      private_subnet_3 = var.private_subnets[2]
      public_subnet_1  = var.public_subnets[0]
      public_subnet_2  = var.public_subnets[1]
      public_subnet_3  = var.public_subnets[2]
    })
}
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
