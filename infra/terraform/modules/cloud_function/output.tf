output "function_url" {
  value = google_cloudfunctions2_function.fn.service_config[0].uri
}