// Registry
resource "google_container_registry" "registry" {
  depends_on =  [google_project_service.registry]

  location = "EU"
}

// Network
data "google_container_registry_repository" "registry" {}

resource "google_compute_network" "clickcount_net" {
  depends_on = [google_project_service.network]
  name = "clickcount-net"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "clickcount_subnet" {
  name = "clickcount-subnet"
  ip_cidr_range = var.cidr_range
  network = google_compute_network.clickcount_net.id
}

resource "google_vpc_access_connector" "connector" {
  depends_on = [google_project_service.vpcaccess]
  name          = "vpcconn"
  region        = var.region
  ip_cidr_range = var.vpc_connect_cidr_range
  network       = google_compute_network.clickcount_net.name
}

// Redis Instances

resource "google_redis_instance" "cache_staging" {
  depends_on = [google_project_service.redis]
  name = "redis-staging"
  memory_size_gb = 1
  labels = {"env" = "staging"}

  authorized_network = google_compute_network.clickcount_net.id
}

resource "google_redis_instance" "cache_prod" {
  depends_on = [google_project_service.redis]
  name = "redis-prod"
  memory_size_gb = 1
  labels = {"env" = "prod"}

  authorized_network = google_compute_network.clickcount_net.id
}