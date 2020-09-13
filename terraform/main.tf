provider "google" {
  project = var.project
  version = "~> 3.38"
  region = var.region
}

provider "gitlab" {
  token   = var.gitlab_token
  version = "~> 2.11"
}
