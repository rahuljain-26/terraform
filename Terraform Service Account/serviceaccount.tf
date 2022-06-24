
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>3.0"
    }
  }
}

variable "gcp_region" {
  type        = string
  description = "Region to use for GCP provider"
  default     = "europe-west3"
  
}

variable "gcp_project" {
  type        = string
  description = "Project to use for this config"
}

provider "google" {
  region  = var.gcp_region
  project = var.gcp_project
}



module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = "terraform-3406"
  prefix        = "svc"
  names         = ["terraformdemo"]
  project_roles = [
    "terraform-3406=>roles/storage.objectViewer",
    "terraform-3406=>roles/dataproc.worker",
    "terraform-3406=>roles/cloudkms.cryptoKeyEncrypterDecrypter"
  ]
}


