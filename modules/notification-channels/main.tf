resource "google_monitoring_notification_channel" "gcp" {
  for_each = var.channel_configs

  type         = each.value.type
  display_name = each.value.display_name
  project      = each.value.project
  labels = {
    "email_address" = each.value.channel_address
  }
}
