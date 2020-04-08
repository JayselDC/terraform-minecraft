# Creates a firewall rule to allow users to connect to the server
resource "google_compute_firewall" "minecraft-inbound-users" {
  name        = "${terraform.workspace}-minecraft-inbound-users"
  description = "Allows users to connect to the server"

  network   = "https://www.googleapis.com/compute/v1/projects/jaysel-minecraft/global/networks/default"
  direction = "INGRESS"
  disabled  = false

  source_ranges = [
    "0.0.0.0/0",
  ]

  target_tags = [
    var.name
  ]

  allow {
    ports = [
      var.minecraft-port,
    ]
    protocol = "tcp"
  }
}

