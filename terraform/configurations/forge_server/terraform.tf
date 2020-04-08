terraform {
  required_version = "0.12.24"

  backend "gcs" {
    bucket      = "minecraft-tf-state"
    credentials = "../jaysel-minecraft.json"
  }
}
