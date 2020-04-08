resource "google_compute_disk" "ssd" {
  name = "${terraform.workspace}-${var.name}-disk"
  type = "pd-ssd"
  zone = "europe-west2-c"
  size = 10
}
