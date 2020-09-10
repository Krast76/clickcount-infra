resource "google_container_registry" "registry" {
  location = "EU"
}

data "google_container_registry_repository" "registry" {}
