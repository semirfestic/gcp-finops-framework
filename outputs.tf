output "gcp_notification_channels" {
  value = { for notification_id, channel_configs in module.finops_notification_channels :
  notification_id => channel_configs }
}

output "dataset_ids" {
  value = { for dataset_id, datasets in module.bigquery_datasets :
  dataset_id => datasets }
}
