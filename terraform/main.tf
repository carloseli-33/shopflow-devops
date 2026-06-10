resource "digitalocean_vpc" "shopflow" {
  name     = "shopflow-vpc"
  region   = var.region
  ip_range = "10.10.0.0/16"
}

resource "digitalocean_kubernetes_cluster" "shopflow" {
  name     = "shopflow-k8s"
  region   = var.region
  version  = "1.36.0-do.1"
  vpc_uuid = digitalocean_vpc.shopflow.id

  node_pool {
    name       = "workers"
    size       = var.k8s_node_size
    node_count = 1
    auto_scale = false

  }
}

resource "digitalocean_database_cluster" "db" {
  name       = "shopflow-postgres"
  engine     = "pg"
  version    = "15"
  size       = "db-s-2vcpu-4gb"
  region     = var.region
  node_count = 1
}
