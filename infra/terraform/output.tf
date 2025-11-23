output "function_url" {
  value = module.cloud_function.function_url
}

output "bronze_dataset" {
  value = module.bigquery.bronze_dataset
}

output "silver_dataset" {
  value = module.bigquery.silver_dataset
}

output "gold_dataset" {
  value = module.bigquery.gold_dataset
}
