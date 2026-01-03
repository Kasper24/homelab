output "prod_kubeconfig" {
  value     = module.k3d.kubeconfig
  sensitive = true
}
