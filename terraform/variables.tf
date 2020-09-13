// Gitlab variables
variable "gitlab_token" {
  type = string
}
variable "gitlab_project_id" {
  type = number
}

// GCP variables
variable "project" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west4"
}

variable "cidr_range" {
  type = string
  default = "192.168.0.0/24"
}

variable "vpc_connect_cidr_range" {
  type = string
  default = "10.8.0.0/28"
}