terraform {
  backend "azurerm" {} // 원격 백엔드 상태 파일 위치. azure.conf 참고
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

resource "azurerm_resource_group" "rg" {
  name     = "rg-tf-01"
  location = "koreacentral"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-tf-01"
  address_space       = ["10.0.0.0/16"]
  location            = "koreacentral"
  resource_group_name = azurerm_resource_group.rg.name

}

resource "azurerm_subnet" "sub1" {
  name = "subnet1"
  address_prefix = "10.0.1.0/24"
  virtual_network_name = azurerm_virtual_network.vnet
  resource_group_name = azurerm_resource_group.rg
}