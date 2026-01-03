resource "k3d_cluster" "cluster" {
    name = var.name
    k3d_config = templatefile("${path.module}/k3d.yaml.tmpl", {
        cluster_name = var.name
        server_count = var.servers
        agent_count  = var.agents
    })
}
