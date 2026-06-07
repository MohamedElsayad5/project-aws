variable "aws_region" {
  description = "aws selected region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "for tagging and resource naming"
  type        = string
  default     = "graduation-project"
}

variable "environment" {
  description = "the deployment environment (dev, staging, prod)"
  type        = string
  default     = "prod"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, staging, or prod."
  }
}

# vpc and networking variables-------------------------------------------------------
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

# ── EKS variables ───────────────────────────────────────
variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "elsayad-eks-cluster"
}

variable "eks_cluster_version" {
  description = "Kubernetes version to use"
  type        = string
  default     = "1.29"
}

variable "eks_node_instance_types" {
  description = "Instance types for the EKS worker nodes"
  type        = list(string)
  default     = ["t3.small"]
}

variable "eks_node_desired_size" {
  description = "The desired number of Worker Nodes"
  type        = number
  default     = 2
}

variable "eks_node_min_size" {
  description = "The minimum number of Worker Nodes"
  type        = number
  default     = 1
}

variable "eks_node_max_size" {
  description = "The maximum number of Worker Nodes"
  type        = number
  default     = 4
}

variable "eks_node_disk_size" {   # EBS disk size for worker nodes
  description = "The size of the EBS disk for each Worker Node in GB"
  type        = number
  default     = 20 # GB 
}