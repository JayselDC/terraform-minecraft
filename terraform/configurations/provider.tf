provider "google" {
  project = "jaysel-minecraft"
  region  = var.region
  zone    = var.zone
  version = "3.5.0"

  credentials = "../jaysel-minecraft.json"
}
