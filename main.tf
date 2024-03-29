terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
    name     = var.resource_group_name
    location = var.location
}

module "virtual-network" {
source = "./modules/virtual-network1"
virtual_network_name            = var.virtual_network_name
resource_group_name             = var.resource_group_name
location                        = var.location
virtual_network_address_space   = var.virtual_network_address_space
subnet_name                     = var.subnet_name
subnet_address_prefix           = var.subnet_address_prefix
}

module "virtual-network2" {
source     = "./modules/virtual-network2"
virtual_network_name2            = var.virtual_network_name2
resource_group_name              = var.resource_group_name
location                         = var.location
virtual_network_address_space2   = var.virtual_network_address_space2
subnet_name2                     = var.subnet_name2
subnet_address_prefix2           = var.subnet_address_prefix2
}

module "vm" {
  source = "./modules/vm1"
  subnetid                       = module.virtual-network.subnet_id
  resource_group_name            = var.resource_group_name
}

module "vm2" {
  source = "./modules/vm2"
  subnet2id                      = module.virtual-network2.subnet2_id
  resource_group_name            = var.resource_group_name
}


module "Vnetpeering" {
  source  = "./modules/vnetpeering"
  resource_group_name            = var.resource_group_name
  virtual_network_name1          = module.virtual-network.vnet_name1
  virtual_network_name2          = module.virtual-network2.vnet_name2
  vnet_1id                       = module.virtual-network.vnet_id1
  vnet_2id                       = module.virtual-network2.vnet_id2

  }