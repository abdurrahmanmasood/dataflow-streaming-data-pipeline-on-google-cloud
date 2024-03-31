provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "data-lake" {
  name                     = var.data-lake-bucket
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "temp-files" {
  name                     = var.temp-file-bucket
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id  = var.dataset-name
  description = "This is a test description"
  location    = "EU"

  access {
    role          = "OWNER"
    user_by_email = google_service_account.bqowner.email
  }
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = var.table-name
  schema     = jsonencode(jsondecode(file("schema.json")))
}

resource "google_pubsub_topic" "topic" {
  name = var.pubsub-topic
}

resource "google_dataflow_job" "pubsub_stream" {
  name                    = var.dataflow-job-name
  template_gcs_path       = var.template_gcs_path
  temp_gcs_location       = var.temp_gcs_location
  enable_streaming_engine = true
  on_delete               = "cancel"
}
