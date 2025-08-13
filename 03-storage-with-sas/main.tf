resource "random_string" "suffix" {
  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg-${random_string.suffix.result}"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = lower(replace("${var.prefix}${random_string.suffix.result}", "-", ""))
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  blob_properties {
    versioning_enabled = true
  }

  lifecycle_rule {
    name    = "expire-old-versions"
    enabled = true

    filter {
      blob_types = ["blockBlob"]
      prefix_match = [""]
    }

    action {
      base_blob {
        delete_after_days_since_modification_greater_than = 180
      }
    }
  }
}

resource "azurerm_storage_container" "container" {
  name                  = "data"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

data "azurerm_storage_account_sas" "sas" {
  connection_string = azurerm_storage_account.sa.primary_connection_string

  https_only               = true
  signed_version           = "2020-02-10"
  start  = time_static.now.rfc3339
  expiry = timeadd(time_static.now.rfc3339, "168h") # 7 days

  resource_types {
    service   = true
    container = true
    object    = true
  }

  services {
    blob  = true
    queue = false
    table = false
    file  = false
  }

  permissions {
    read    = true
    write   = true
    delete  = true
    list    = true
    add     = false
    create  = true
    update  = true
    process = false
    tag     = false
    filter  = false
  }
}

resource "time_static" "now" {}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "container_name" {
  value = azurerm_storage_container.container.name
}

output "sas_url_for_container" {
  value = "https://${azurerm_storage_account.sa.name}.blob.core.windows.net/${azurerm_storage_container.container.name}?${data.azurerm_storage_account_sas.sas.sas}"
  sensitive = true
}
