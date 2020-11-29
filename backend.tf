terraform {
  backend "azurerm" {
    resource_group_name  = "rg-ops-prd-we"
    storage_account_name = "sa-ops-prd-we"
    container_name       = "tfstate"
    key                  = "codeherent.terraform.tfstate"
  }
}