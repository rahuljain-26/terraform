terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.0"
    }
  }
}


provider "google" {
  region  = var.gcp_region
  project = var.gcp_project
}

module "gcs_buckets" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 2.2"
  project_id  = var.gcp_project
  names = ["dataproc-initialization-actions", "staging-bucket"]
  prefix = "tf"
  set_admin_roles = true
  admins = [""]
  location = var.gcp_region
  storage_class = "STANDARD"
  versioning = {
    first = true
  }
  
}