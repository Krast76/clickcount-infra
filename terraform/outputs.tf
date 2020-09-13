output "registry" {
  value = data.google_container_registry_repository.registry.repository_url
}

output "connection_uri" {
  value = google_vpc_access_connector.connector.id
}
