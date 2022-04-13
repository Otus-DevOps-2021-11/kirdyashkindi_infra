resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # ������� id ������ ���������� � ���������� ������� �������
      image_id = var.image_id
    }
  }

  network_interface {
    # ������ id ������� default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
