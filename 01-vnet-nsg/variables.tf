variable "prefix" {
  description = "Prefix to use for resource names"
  type        = string
  default     = "demo1"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westeurope"
}

variable "vnet_cidr" {
  description = "VNet CIDR"
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet CIDR"
  type        = string
  default     = "10.10.1.0/24"
}

variable "allowed_cidr" {
  description = "CIDR allowed inbound to NSG (e.g., your IP /32)"
  type        = string
  default     = "0.0.0.0/0"
}
