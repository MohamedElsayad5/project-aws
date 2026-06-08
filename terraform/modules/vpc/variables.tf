# ============================================================
# modules/vpc/variables.tf
# ============================================================

variable "project_name" {
  description = "اسم المشروع"
  type        = string
}

variable "eks_cluster_name" {
  description = "اسم الـ EKS Cluster (مطلوب للـ Tags)"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC (e.g., 10.0.0.0/16)"
  type        = string
}

variable "availability_zones" {
  description = " list of availability zones to use (e.g., [\"us-east-1a\", \"us-east-1b\"])"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets (e.g., [\"10.0.1.0/24\", \"10.0.2.0/24\"])"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets (e.g., [\"10.0.3.0/24\", \"10.0.4.0/24\"])"
  type        = list(string)
}