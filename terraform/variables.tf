variable "project_id" {
  description = "GCP project id."
}

variable "region" {
  description = "GCP project region."
}

variable "data-lake-bucket" {
  description = "Bucket used as data lake."
}

variable "temp-file-bucket" {
  description = "Bucket need to store temporary files which are generated while running dataflow job."
}

variable "dataset-name" {
  description = "BigQuery dataset used to store table."
}

variable "table-name" {
  description = "BigQuery table used to store data."
}

variable "pubsub-topic" {
  description = "Pubsub topic name which is used as streaming source"
}

variable "dataflow-job-name" {
  description = "Dataflow job name."
}

variable "template_gcs_path" {
  description = "Dataflow job name."
}

variable "temp_gcs_location" {
  description = "Dataflow temp files location."
}
