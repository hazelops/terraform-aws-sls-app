locals {
  private_subnets = var.serialize_lists ? {
    private_subnets = var.join_lists ? join(",", var.private_subnets) : jsonencode(var.private_subnets)
    } : length(var.private_subnets) > 1 ? { for k, v in var.private_subnets : "private_subnet_${k + 1}" => v } : {
    for k, v in var.private_subnets : "private_subnet" => v
  }

  public_subnets = var.serialize_lists ? {
    public_subnets = var.join_lists ? join(",", var.public_subnets) : jsonencode(var.public_subnets)
    } : length(var.public_subnets) > 1 ? { for k, v in var.public_subnets : "public_subnet_${k + 1}" => v } : {
    for k, v in var.public_subnets : "public_subnet" => v
  }

  security_groups = var.serialize_lists ? {
    security_groups = var.join_lists ? join(",", var.security_groups) : jsonencode(var.security_groups)
    } : length(var.security_groups) > 1 ? { for k, v in var.security_groups : "security_group_${k + 1}" => v } : {
    for k, v in var.security_groups : "security_group" => v
  }

  # We're passing vpc_id like that b/c it won't be available yet during Terraform Plan and for_each would fail.
  # The side effect of this would be vpc_id parameter present even if no vpc is used. But who does that nowadays anyway?
  vpc = {
    vpc_id = var.vpc_id
  }


  parameters = merge(
    { ENV = var.env },
    var.parameters,
    local.private_subnets,
    local.public_subnets,
    local.security_groups,
    local.vpc
  )
}
