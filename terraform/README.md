## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_bigquery_dataset.dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset) | resource |
| [google_bigquery_table.table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table) | resource |
| [google_dataflow_job.pubsub_stream](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataflow_job) | resource |
| [google_pubsub_topic.topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_service_account.bqowner](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_storage_bucket.data-lake](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket.temp-files](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data-lake-bucket"></a> [data-lake-bucket](#input\_data-lake-bucket) | Bucket used as data lake. | `any` | n/a | yes |
| <a name="input_dataflow-job-name"></a> [dataflow-job-name](#input\_dataflow-job-name) | Dataflow job name. | `any` | n/a | yes |
| <a name="input_dataset-name"></a> [dataset-name](#input\_dataset-name) | BigQuery dataset used to store table. | `any` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | GCP project id. | `any` | n/a | yes |
| <a name="input_pubsub-topic"></a> [pubsub-topic](#input\_pubsub-topic) | Pubsub topic name which is used as streaming source | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | GCP project region. | `any` | n/a | yes |
| <a name="input_table-name"></a> [table-name](#input\_table-name) | BigQuery table used to store data. | `any` | n/a | yes |
| <a name="input_temp-file-bucket"></a> [temp-file-bucket](#input\_temp-file-bucket) | Bucket need to store temporary files which are generated while running dataflow job. | `any` | n/a | yes |
| <a name="input_temp_gcs_location"></a> [temp\_gcs\_location](#input\_temp\_gcs\_location) | Dataflow temp files location. | `any` | n/a | yes |
| <a name="input_template_gcs_path"></a> [template\_gcs\_path](#input\_template\_gcs\_path) | Dataflow job name. | `any` | n/a | yes |

## Outputs

No outputs.
