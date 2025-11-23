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
  }
}
