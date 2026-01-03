provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token

  insecure = true

  ssh {
    agent = true
    user  = "root"
  }
}

resource "proxmox_virtual_environment_vm" "vm" {
  node_name = var.proxmox_node

  name        = var.vm_name
  machine     = "q35"
  bios        = "ovmf"
  description = "VM created by Terraform"

  cpu {
    cores   = var.vm_cpu_cores
    sockets = 1
  }

  memory {
    dedicated = var.vm_memory_mb
    floating  = var.vm_memory_mb
  }

  network_device {
    bridge = var.proxmox_bridge
  }

  disk {
    datastore_id = var.proxmox_datastore
    import_from  = proxmox_virtual_environment_download_file.cloud_image.id
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.vm_disk_size_gb
  }

  efi_disk {
    datastore_id = var.proxmox_datastore
    type         = "4m"
  }

  initialization {
    user_account {
      username = var.vm_ssh_user
      keys     = [file(var.ssh_public_key_path)]
    }
    ip_config {
      ipv4 {
        address = var.vm_ip_address
        gateway = var.vm_gateway
      }
    }
  }
}

resource "proxmox_virtual_environment_download_file" "cloud_image" {
  content_type = "import"
  datastore_id = var.proxmox_datastore
  node_name    = var.proxmox_node
  url          = var.vm_cloud_image_url
}
