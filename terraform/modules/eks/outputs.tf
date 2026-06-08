# EKS Cluster Outputs
output "cluster_name"     { value = aws_eks_cluster.this.name }
output "cluster_endpoint" { value = aws_eks_cluster.this.endpoint }
output "cluster_version"  { value = aws_eks_cluster.this.version }
output "oidc_issuer"      { value = aws_eks_cluster.this.identity[0].oidc[0].issuer }
output "nodes_role_arn"   { value = aws_iam_role.nodes.arn }