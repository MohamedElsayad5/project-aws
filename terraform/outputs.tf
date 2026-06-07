
# ── VPC Outputs ───────────────────────────────────────────
output "vpc_id" {
  description = "vpc main ID"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "vpc cidr block"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs the Public Subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs the Private Subnets"
  value       = aws_subnet.private[*].id
}

output "nat_gateway_ips" {
  description = "fixed public IPs of the NAT Gateways (useful for whitelisting in security groups or external services)"
  value       = aws_eip.nat[*].public_ip
}

# ── EKS Outputs ───────────────────────────────────────────
output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.main.name
}

output "eks_cluster_endpoint" {
  description = "EKS API Server Endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "eks_cluster_version" {
  description = "EKS Cluster Version"
  value       = aws_eks_cluster.main.version
}

output "eks_oidc_issuer" {
  description = "OIDC Issuer URL للـ IRSA"
  value       = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "eks_node_group_role_arn" {
  description = "ARN for the IAM Role associated with the EKS Worker Nodes"
  value       = aws_iam_role.eks_nodes.arn
}

# ── Command to update kubeconfig (copy and run after Apply) ─────────
output "configure_kubectl" {
  description = "Command to update kubeconfig for connecting to the cluster"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${aws_eks_cluster.main.name}"
}