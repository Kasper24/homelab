module "k3d" {
  source = "../../modules/k3d"

  name    = var.name
  servers = var.servers
  agents  = var.agents
}
