resource "gitlab_project_variable" "registry-url" {
  project           = var.gitlab_project_id
  key               = "REGISTRY_URL"
  value             = data.google_container_registry_repository.registry.repository_url
  protected         = true
  environment_scope = "*"
}

resource "gitlab_project_variable" "image-name" {
  project           = var.gitlab_project_id
  key               = "IMAGE_NAME"
  value             = "clickcount"
  protected         = true
  environment_scope = "*"
}

resource "gitlab_project_variable" "gcp-creds" {
  project           = var.gitlab_project_id
  key               = "GOOGLE_CREDS"
  value             = base64decode(google_service_account_key.gcr-push-key.private_key)
  protected         = true
  environment_scope = "*"
}
