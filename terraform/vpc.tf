# ============================================================
# vpc.tf (root) — يستدعي الـ VPC Module
# ============================================================

module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  eks_cluster_name     = var.eks_cluster_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}