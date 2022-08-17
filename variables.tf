variable "name" {}
variable "env" {}

variable "parameters" {
  type = map(string)
}

variable "global_parameters" {
  type    = map(string)
  default = {}
}

variable "app_secrets" {
  type        = list(any)
  description = "List of SSM ParameterStore secret parameters - by default, /$var.env/$var.name/*"
  default     = []
}

variable "global_secrets" {
  type        = list(any)
  description = "List of SSM ParameterStore global secrets - by default, /$var.env/global/*"
  default     = []
}

variable "public_subnets" {
  type        = list(any)
  description = "VPC Public subnets to place SLS resources"
  default     = []
}

variable "private_subnets" {
  type        = list(any)
  description = "VPC Private subnets to place SLS resources"
  default     = []
}

variable "security_groups" {
  type        = list(any)
  description = "Security groups to assign to SLS"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
  default     = "-"
}

locals {
  private_subnets = {for k, v in var.private_subnets : length(var.private_subnets) > 1 ? "private_subnet_${k + 1}" : "private_subnet" => v}
  public_subnets  = {for k, v in var.public_subnets : length(var.public_subnets) > 1 ? "public_subnet_${k + 1}" : "public_subnet" => v}
  security_groups = {for k, v in var.security_groups : length(var.security_groups) > 1 ? "security_group_${k + 1}" : "security_group" => v}

  parameters = merge(
    var.parameters,
    local.public_subnets,
    local.private_subnets,
    local.security_groups,
    { vpc_id = var.vpc_id }
  )
}
