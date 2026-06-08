# modules/security-groups/variables.tf
variable "project_name" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}