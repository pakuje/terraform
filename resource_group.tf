resource "azurerm_resource_group" "rg03" {
  name     = "dev_pkj_rg01"
  location = var.location
}

resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_resource_group" "rg03" {
  name     = "dev_pkj_rg02"
  location = var.location
}