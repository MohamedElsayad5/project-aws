# EKS Cluster Module
module "eks" {
  source = "./modules/eks"

  project_name        = var.project_name
  environment         = var.environment
  eks_cluster_name    = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version

  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_sg_id      = module.security_groups.eks_cluster_sg_id

  node_instance_types = var.eks_node_instance_types
  node_desired_size   = var.eks_node_desired_size
  node_min_size       = var.eks_node_min_size
  node_max_size       = var.eks_node_max_size
  node_disk_size      = var.eks_node_disk_size

  depends_on = [module.vpc, module.security_groups]
}