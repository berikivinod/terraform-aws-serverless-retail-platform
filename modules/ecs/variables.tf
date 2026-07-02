variable "name" {}

variable "vpc_id" {}

variable "private_subnets" {
  type = list(string)
}

variable "target_group_arn" {}

variable "ecr_repository_url" {}

variable "alb_security_group_id" {}