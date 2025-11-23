terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "us-central1"
}

module "cloud_function" {
  source         = "./modules/cloud_function"
  region         = var.region
  bucket         = var.function_bucket
  object         = var.function_object
  project_id     = var.project_id
}

module "scheduler" {
  source       = "./modules/scheduler"
  function_url = module.cloud_function.function_url

  depends_on = [
    module.cloud_function
  ]
}

module "bigquery" {
  source = "./modules/bigquery"
}

