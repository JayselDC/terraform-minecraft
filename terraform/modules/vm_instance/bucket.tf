resource "google_storage_bucket" "server-backup" {
  name          = "${terraform.workspace}-${var.name}-backup"
  location      = "EUROPE-WEST2"
  force_destroy = true

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 3
    }
  }
}
