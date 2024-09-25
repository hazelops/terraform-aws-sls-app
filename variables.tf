variable "name" {}
variable "env" {}

variable "parameters" {
  type        = map(string)
  description = "Map of SSM ParameterStore parameters to store - by default, /$var.env/$var.name/*"
}

variable "global_parameters" {
  type        = map(string)
  description = "Map of SSM ParameterStore global parameters to store - by default, /$var.env/global/*"
  default     = {}
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

variable "serialize_lists" {
  type        = bool
  description = "Whether to serialize lists like subnets and security groups into a one SSM parameter"
  default     = true
}

variable "join_lists" {
  type        = bool
  description = "Whether to join lists like subnets and security groups into a one SSM parameter string with comma separator"
  default     = false
}
