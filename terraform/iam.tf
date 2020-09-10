resource "google_service_account" "gcr-push" {
  account_id   = "gcr-push"
  display_name = "Service Account used to push to GCR from Gitlab"
}

resource "google_storage_bucket_iam_member" "admin" {
  bucket = google_container_registry.registry.id
  role = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.gcr-push.email}"
}
resource "google_project_iam_binding" "sa_role_binding" {
  role = "roles/storage.admin"

  members = [
    "serviceAccount:${google_service_account.gcr-push.email}",
  ]
}

resource "google_service_account_key" "gcr-push-key" {
  service_account_id = google_service_account.gcr-push.name
}
