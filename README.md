# Terraform AWS Serverless App Module
Terraform module to create AWS Serverless application.

##  How to use:
```hcl
module "pecan" {
  name            = "pecan"
  source          = "hazelops/sls-app/aws"
  env             = var.env
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  security_groups = ["sg-xxxxxxxxxxxxxxxxx"]
  
  parameters = {
    "API_KEY": "demo"
  }
  
  app_secrets = [
    "demo_secret_name"
  ]

  global_parameters = {}
  global_secrets    = []
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_global_secrets"></a> [global\_secrets](#module\_global\_secrets) | hazelops/ssm-secrets/aws | ~> 1.0 |
| <a name="module_secrets"></a> [secrets](#module\_secrets) | hazelops/ssm-secrets/aws | ~> 1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.sls_global_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.sls_parameter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_secrets"></a> [app\_secrets](#input\_app\_secrets) | List of SSM ParameterStore secret parameters - by default, /$var.env/$var.name/* | `list(any)` | `[]` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_global_parameters"></a> [global\_parameters](#input\_global\_parameters) | Map of SSM ParameterStore global parameters to store - by default, /$var.env/global/* | `map(string)` | `{}` | no |
| <a name="input_global_secrets"></a> [global\_secrets](#input\_global\_secrets) | List of SSM ParameterStore global secrets - by default, /$var.env/global/* | `list(any)` | `[]` | no |
| <a name="input_join_lists"></a> [join\_lists](#input\_join\_lists) | Whether to join lists like subnets and security groups into a one SSM parameter string with comma separator | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Map of SSM ParameterStore parameters to store - by default, /$var.env/$var.name/* | `map(string)` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | VPC Private subnets to place SLS resources | `list(any)` | `[]` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | VPC Public subnets to place SLS resources | `list(any)` | `[]` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | Security groups to assign to SLS | `list(any)` | `[]` | no |
| <a name="input_serialize_lists"></a> [serialize\_lists](#input\_serialize\_lists) | Whether to serialize lists like subnets and security groups into a one SSM parameter | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | AWS VPC ID | `string` | `"-"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
