module "bigquery_datasets" {
  source = "./modules/finops-bigquery/datasets"

  project_id = "vmware-migration-vmware-lab"
  datasets = {
    "customer_x_cost_export_ds" = {
      friendly_name = "customer_x_cost_export_ds"
      dataset_id    = "customer_x_cost_export_ds"
      labels = {
        "env" = "prod"
      }
      location              = "EU"
      max_time_travel_hours = "168"
    }
    "customer_x_usage_export_ds" = {
      friendly_name = "customer_x_usage_export_ds"
      dataset_id    = "customer_x_usage_export_ds"
      labels = {
        "env" = "prod"
      }
      location              = "EU"
      max_time_travel_hours = "168"
    }
    "customer_x_finops_datasets" = {
      friendly_name = "customer_x_finops_datasets"
      dataset_id    = "customer_x_finops_datasets"
      labels = {
        "env" = "prod"
      }
      location              = "EU"
      max_time_travel_hours = "168"
    }
  }
}
