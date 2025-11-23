resource "google_cloud_scheduler_job" "job" {
  name      = "who_api_monthly_ingest"
  schedule  = "0 16 23 * *"
  time_zone = "America/Sao_Paulo"
  region    = "us-central1"

  http_target {
    http_method = "POST"
    uri         = var.function_url
  }
}