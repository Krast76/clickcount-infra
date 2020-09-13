output "registry" {
  value = data.google_container_registry_repository.registry.repository_url
}

output "connection_uri" {
  value = google_vpc_access_connector.connector.id
}

output "cache_staging_addr" {
  value = google_redis_instance.cache_staging.host
}

output "cache_prod_addr" {
  value = google_redis_instance.cache_prod.host
}