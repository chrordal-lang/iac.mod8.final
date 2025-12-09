terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  # Remote state backend i Azure Storage
  backend "azurerm" {
  resource_group_name  = "rg-tfstate-chris.mod8"
  storage_account_name = "storageaccmod8chris"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
}

}

provider "azurerm" {
  features {}
}

# Resource Group for miljøet (dev/test/prod)
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

# Storage Account i miljøet
resource "azurerm_storage_account" "sa" {
  name                     = local.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
}
