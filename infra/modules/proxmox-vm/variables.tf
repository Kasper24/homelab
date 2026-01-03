variable "proxmox_endpoint" {
  description = "The Proxmox VE API endpoint URL."
  type        = string
  sensitive = true
}

variable "proxmox_api_token" {
  description = "The Proxmox VE API token for authentication."
  type        = string
  sensitive = true
}

variable "proxmox_node" {
  description = "The Proxmox VE node name where the VM will be created."
  type        = string
}

variable "proxmox_datastore" {
  description = "The Proxmox VE datastore ID where the VM disk will be stored."
  type        = string
}

variable "proxmox_bridge" {
  description = "The Proxmox VE network bridge to attach the VM's network interface."
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_cpu_cores" {
  description = "The number of CPU cores for the virtual machine."
  type        = number
  default     = 2
}

variable "vm_memory_mb" {
  description = "The amount of memory (in MB) for the virtual machine."
  type        = number
  default     = 2048
}

variable "vm_disk_size_gb" {
  description = "The size of the VM disk in GB."
  type        = number
  default     = 20
}

variable "vm_ssh_user" {
  description = "The SSH username for the VM."
  type        = string
  default     = "ubuntu"
}

variable "vm_ip_address" {
  description = "The static IP address to assign to the VM."
  type        = string
}

variable "vm_gateway" {
  description = "The gateway IP address for the VM."
  type        = string
}

variable "ssh_public_key_path" {
  description = "The file path to the SSH public key to be added to the VM."
  type        = string
}

variable "vm_cloud_image_url" {
  description = "The URL of the cloud image to be used for the VM."
  type        = string
}
