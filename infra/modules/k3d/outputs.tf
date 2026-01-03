output "kubeconfig" {
  value     = k3d_cluster.cluster.kubeconfig
  sensitive = true
}
