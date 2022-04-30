resource "azurerm_virtual_network" "vnet2" {
    name                        = var.virtual_network_name2
    resource_group_name         = var.resource_group_name
    location                    = var.location
    address_space               = var.virtual_network_address_space2
}
resource "azurerm_subnet" "subnet1" {
    name                    = var.subnet_name2
    resource_group_name     = var.resource_group_name
    virtual_network_name    = azurerm_virtual_network.vnet2.name
    address_prefixes        = var.subnet_address_prefix2
}