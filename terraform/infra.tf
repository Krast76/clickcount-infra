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
