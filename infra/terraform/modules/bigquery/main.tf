resource "google_bigquery_dataset" "bronze" {
  dataset_id = "${var.project_id}_bronze"
  location   = "us-central1"
}

resource "google_bigquery_dataset" "silver" {
  dataset_id = "${var.project_id}_silver"
  location   = "us-central1"
}

resource "google_bigquery_dataset" "gold" {
  dataset_id = "${var.project_id}_gold"
  location   = "us-central1"
}
