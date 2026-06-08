# Security Groups for EKS Cluster
module "security_groups" {
  source = "./modules/security-groups"

  project_name     = var.project_name
  eks_cluster_name = var.eks_cluster_name
  vpc_id           = module.vpc.vpc_id
  vpc_cidr         = var.vpc_cidr

  depends_on = [module.vpc]
}