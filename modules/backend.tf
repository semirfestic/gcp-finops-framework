terraform {
  backend "gcs" {
    bucket = "customer-name-finops-tf-state"
    prefix = "finops-bq-ds-state"
  }
}
