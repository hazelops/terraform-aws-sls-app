# Terraform AWS Serverless App Module
Terraform module to create AWS Serverless application.


##  How to use:
```terraform
module "sls" {
name            = "sls"
source          = "../../terraform/sls-service"
env             = var.env
vpc_id          = module.vpc.vpc_id
public_subnets  = module.vpc.public_subnets
private_subnets = module.vpc.private_subnets
parameters = {
security_group_id = <security group id>
}
app_secrets = [
"demo_secret_name"
]

global_parameters = {}
global_secrets    = []

}
```


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

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
| <a name="input_efs_mount_point"></a> [efs\_mount\_point](#input\_efs\_mount\_point) | n/a | `string` | `"/mnt/efs"` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_global_parameters"></a> [global\_parameters](#input\_global\_parameters) | n/a | `map(string)` | `{}` | no |
| <a name="input_global_secrets"></a> [global\_secrets](#input\_global\_secrets) | n/a | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | n/a | `map(string)` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | n/a | `list` | `[]` | no |
| <a name="input_volume"></a> [volume](#input\_volume) | n/a | `map` | `{}` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | `any` | n/a | yes |

## Outputs

No outputs.
