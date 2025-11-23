resource "google_cloudfunctions2_function" "fn" {
  name     = "who_ingest_function"
  location = var.region

  build_config {
    runtime     = "python312"
    entry_point = "main"

    source {
      storage_source {
        bucket = var.bucket
        object = var.object
      }
    }
  }

  service_config {
    max_instance_count = 1

    environment_variables = {
      PROJECT_ID = var.project_id
    }
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  location = var.region
  project  = var.project_id

  service  = google_cloudfunctions2_function.fn.service_config[0].service
  role     = "roles/run.invoker"
  member   = "allUsers"

  depends_on = [
    google_cloudfunctions2_function.fn
  ]
}