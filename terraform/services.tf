resource "google_project_service" "build" {
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "registry" {
  service            = "containerregistry.googleapis.com"
  disable_on_destroy = false
}
