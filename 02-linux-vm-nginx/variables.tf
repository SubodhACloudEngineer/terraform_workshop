variable "prefix" {
  description = "Prefix to use for resource names"
  type        = string
  default     = "demo2"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "allowed_cidr" {
  description = "CIDR allowed to SSH (e.g., your_ip/32)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "vm_size" {
  description = "Size for the Linux VM"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "VM admin username"
  type        = string
  default     = "azureuser"
}
