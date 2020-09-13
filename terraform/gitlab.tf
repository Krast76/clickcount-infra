resource "gitlab_project_variable" "project" {
  project           = var.gitlab_project_id
  key               = "PROJECT"
  value             = var.project
  protected         = true
  environment_scope = "*"
}
resource "gitlab_project_variable" "vpc_connector" {
  project           = var.gitlab_project_id
  key               = "VPC_CONNECTOR"
  value             = google_vpc_access_connector.connector.id
  protected         = true
  environment_scope = "*"
}

resource "gitlab_project_variable" "cache_prod" {
  project           = var.gitlab_project_id
  key               = "CACHE_PROD_ADDR"
  value             = google_redis_instance.cache_prod.host
  protected         = true
  environment_scope = "*"
}

resource "gitlab_project_variable" "cache_staging" {
  project           = var.gitlab_project_id
  key               = "CACHE_STAGING_ADDR"
  value             = google_redis_instance.cache_staging.host
  protected         = true
  environment_scope = "*"
}