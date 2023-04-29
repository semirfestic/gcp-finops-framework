module "bigquery_datasets" {
  source = "./modules/finops-bigquery/datasets"

  project_id = "finops-gcp-project"
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
module "bigquery_tables" {
  source     = "./modules/finops-bigquery/tables"
  project_id = "finops-gcp-project"

  tables = {
    "tech_summary_view" = {
      dataset  = module.bigquery_datasets.dataset_ids["customer_x_cost_export_ds"]
      location = "EU"
      labels = {
        dataset = "dashboard"
      }
      deletion_protection = false
      query               = <<-EOF
      SELECT
        ts.execution_time,
        ts.project_id,
        pd.project_name,
        ts.guest_vcpus,
        ts.reserved_cores,
        ts.gcs_storage_gb,
        ts.pubsub_storage_kb,
        ts.bq_storage_gb,
        pd.product,
        pd.domain
      FROM
        `var.monitoring_project.finops_data.technical_summary` AS ts
      LEFT JOIN
        `var.monitoring_project.finops_data.gcp_project_data_view` pd
      ON
        ts.project_id = pd.project_id
    EOF
    },
  }
}

