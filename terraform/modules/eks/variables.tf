# modules/eks/variables.tf
variable "project_name"        { type = string }
variable "environment"         { type = string }
variable "eks_cluster_name"    { type = string }
variable "eks_cluster_version" { type = string }
variable "public_subnet_ids"   { type = list(string) }
variable "private_subnet_ids"  { type = list(string) }
variable "cluster_sg_id"       { type = string }
variable "node_instance_types" { type = list(string) }
variable "node_desired_size"   { type = number }
variable "node_min_size"       { type = number }
variable "node_max_size"       { type = number }
variable "node_disk_size"      { type = number }