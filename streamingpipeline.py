import json
import apache_beam as beam
from datetime import date
from apache_beam.io.gcp.pubsub import ReadFromPubSub
from apache_beam.io.gcp.bigquery import WriteToBigQuery
from apache_beam.options.pipeline_options import PipelineOptions


custom_gcs_temp_location = "gs://dataflow_temp_storage_<name>"
subscription_name = "projects/<project_id>/subscriptions/taxirides"
output_table = "<project_id>:nyctaxi.taxirides-realtime"
schema = """ride_id:STRING,
point_idx:INTEGER,
latitude:FLOAT64,
longitude:FLOAT64,
timestamp:TIMESTAMP,
meter_reading:FLOAT64,
meter_increment:FLOAT64,
ride_status:STRING,
passenger_count:INTEGER"""


def process_columns(element):
    data = element.decode("utf-8")
    data = json.loads(data)
    return data


beam_options = PipelineOptions(
    streaming=True,
    runner='DataflowRunner',
    project='<project_id>',
    job_name='<job_name>',
    staging_location="gs://dataflow_temp_storage_<name>/staging",
    temp_location='gs://dataflow_temp_storage_<name>/temp',
    template_location="gs://dataflow_temp_storage_<name>/templates/streamingpipeline",
    region='us-central1')

with beam.Pipeline(options=beam_options) as pipeline:

    input_data = pipeline | "Read from Pub/Sub" >> ReadFromPubSub(subscription=subscription_name)

    processed_data = input_data | 'ProcessColumns' >> beam.Map(process_columns)

    processed_data  | 'WriteToBigQuery' >> WriteToBigQuery(
         table=output_table,
         schema=schema,
         custom_gcs_temp_location=custom_gcs_temp_location,
         create_disposition=beam.io.BigQueryDisposition.CREATE_IF_NEEDED,
         write_disposition=beam.io.BigQueryDisposition.WRITE_APPEND)
    