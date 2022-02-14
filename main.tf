terraform {
  backend "azurerm" {
    resource_group_name  = "terraform_test"
    storage_account_name = "stopkjterraform"
    container_name       = "teraformstate"
    key                  = "terraform.tfstate"
  } 
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# create resource group
resource "azurerm_resource_group" "rg1" {
  name     = "rg-tf-01"    
  location = var.location
  tags = {
    Environment  = "tf-test1"
    Environment1 = "tf-test2"    
    Environment3 = "tf-test2"
  }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet-tf-01"
  address_space       = ["10.0.0.0/16"]
  location            = "koreacentral"
  resource_group_name = azurerm_resource_group.rg1.name
}
