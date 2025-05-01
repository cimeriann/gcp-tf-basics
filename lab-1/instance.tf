resource "google_compute_instance" "terraform" {
  project      = ""
  name         = "terraform"
  machine_type = "e2-medium"
  zone         = ""

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2

    echo "<h1>Hello, World!</h1>" > /var/www/html/index.html
    echo "<p>Instance Name: ${google_compute_instance.terraform.name}</p>" >> /var/www/html/index.html
    echo "<p>Instance Zone: ${google_compute_instance.terraform.zone}</p>" >> /var/www/html/index.html
    echo "<p>Instance IP: $(curl -s http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H \"Metadata-Flavor: Google\")</p>" >> /var/www/html/index.html
  EOT
}
