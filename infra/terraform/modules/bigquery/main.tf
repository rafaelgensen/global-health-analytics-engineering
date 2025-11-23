resource "google_bigquery_dataset" "bronze" {
  dataset_id = "global-health-analytics-engineering_23112025_bronze"
  location   = "us-central1"
}

resource "google_bigquery_dataset" "silver" {
  dataset_id = "global-health-analytics-engineering_23112025_silver"
  location   = "us-central1"
}

resource "google_bigquery_dataset" "gold" {
  dataset_id = "global-health-analytics-engineering_23112025_gold"
  location   = "us-central1"
}
