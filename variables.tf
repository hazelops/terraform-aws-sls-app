variable "name" {}
variable "env" {}
variable "parameters" {
  type = map(string)
}
variable "global_parameters" {
  type = map(string)
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

variable "volume" {
  default = {}
}

variable "efs_mount_point" {
  default = "/mnt/efs"
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

variable "vpc_id" {
  type        = string
  description = "AWS VPC ID"
  default = ""
}

