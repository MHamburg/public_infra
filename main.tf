data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg_landingpage" {
  name = "rg-landingpage-we-${var.env}"
  location = "West Europe"
}

resource "azurerm_key_vault" "example" {
  name = "kv-landingpage-we-${var.env}"
  location = azurerm_resource_group.rg_landingpage.location
  resource_group_name = azurerm_resource_group.rg_landingpage.name
  enabled_for_disk_encryption = true
  tenant_id = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled = true
  soft_delete_retention_days = 7
  purge_protection_enabled = false
  sku_name = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    secret_permissions = [
      "get",
      "set",
      "list",
      "delete",
    ]
  }
  network_acls {
    default_action = "Allow"
    bypass = "AzureServices"
  }
  contact {
    email = "example@example.com"
    name = "example"
    phone = "0123456789"
  }
  tags = {
    environment = var.env
    application = "landingpage"
  }
}

resource "azurerm_storage_account" "storage_account" {
  resource_group_name = azurerm_resource_group.rg_landingpage
  name = 
  account_replication_type = 
  account_tier = 
  location = azurerm_resource_group.rg_landingpage
}

resource "azurerm_virtual_machine" "virtual_machine" {
  name = 
  network_interface_ids = [  ]
  storage_os_disk {
    name = 
    create_option = 
  }
  resource_group_name = 
  vm_size = 
  location = 
}

resource "azurerm_virtual_machine" "virtual_machine_two" {
  name = "just_a_vm"
  network_interface_ids = [  ]
  storage_os_disk {
    name = 
    create_option = 
  }
  resource_group_name = azurerm_resource_group.rg_landingpage.name
  vm_size = 
  location = azurerm_resource_group.rg_landingpage.location
}