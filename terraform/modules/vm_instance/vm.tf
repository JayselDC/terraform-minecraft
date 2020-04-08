resource "google_compute_instance" "instance" {
  name         = "${terraform.workspace}-${var.name}"
  machine_type = "n1-standard-1"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      size  = 10
      type  = "pd-ssd"
    }
  }

  attached_disk {
    source      = google_compute_disk.ssd.self_link
    device_name = google_compute_disk.ssd.name
  }

  network_interface {
    network = "https://www.googleapis.com/compute/v1/projects/jaysel-minecraft/global/networks/default"

    access_config {
      nat_ip = var.public_ip
    }
  }

  service_account {
    scopes = ["storage-rw"]
  }

  scheduling {
    automatic_restart = false
    preemptible       = true
  }

  tags = [var.name]

  metadata = {
    shutdown-script = <<EOT
      #!/bin/bash
      sudo screen -r -X stuff '/stop\n'
    EOT

    startup-script  = <<EOT
      #!/bin/bash
      if grep -qs '/dev/sdb ' /proc/mounts; 
      then
      (crontab -l ; echo "0 */4 * * * /home/minecraft/backup.sh ${google_storage_bucket.server-backup.name}")| crontab -
      cd /home/minecraft
      screen -dmS mcs java -Xms1G -Xmx3G -d64 -jar ${var.server_jar}.jar nogui
      else
      mount /dev/disk/by-id/google-${google_compute_disk.ssd.name} /home/minecraft
      (crontab -l ; echo "0 */4 * * * /home/minecraft/backup.sh ${google_storage_bucket.server-backup.name}")| crontab -
      cd /home/minecraft
      screen -dmS mcs java -Xms1G -Xmx3G -d64 -jar ${var.server_jar}.jar nogui
      fi
    EOT

    ssh-keys = "${var.ssh_user}:${var.ssh_pubkey}"
  }

  connection {
    type = "ssh"
    user = "jayseldelacruz"
    host = google_compute_instance.instance.network_interface[0].access_config[0].nat_ip

    private_key = file("${path.module}/files/id_rsa")
  }

  # Set up dependencies
  provisioner "remote-exec" {
    inline = [
      "sudo mkdir /home/minecraft",
      "sudo mkfs.ext4 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/disk/by-id/google-${google_compute_disk.ssd.name}",
      "sudo mount -o discard,defaults /dev/disk/by-id/google-${google_compute_disk.ssd.name} /home/minecraft",
      "sudo apt-get update",
      "sudo apt-get install -y default-jre-headless",
      "sudo apt-get install -y unzip",
      "sudo apt-get install -y screen",
      "cd /home/minecraft",
      "sudo gsutil cp gs://jaysel-minecraft-mods/setup/${var.server_jar}-installer.jar /home/minecraft/${var.server_jar}-installer.jar",
      "sudo gsutil cp gs://jaysel-minecraft-mods/setup/mods.zip /home/minecraft/",
      "sudo gsutil cp gs://jaysel-minecraft-mods/setup/backup.sh /home/minecraft/",
      "sudo java -jar ${var.server_jar}-installer.jar --installServer",
      "sudo chmod +x backup.sh",
      "sudo java -Xms1G -Xmx3G -d64 -jar ${var.server_jar}.jar nogui",
      "sudo rm -rf /home/minecraft/mods",
      "sudo unzip mods.zip",
      "sudo rm -rf mods.zip",
      "sudo crontab -l ; echo '0 */4 * * * /home/minecraft/backup.sh ${google_storage_bucket.server-backup.name}'",
      "exit"
    ]
  }
}
