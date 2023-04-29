output "dataset_ids" {
  value = { for dataset_id, datasets in module.bigquery_datasets : 
  dataset_id => datasets }
}
