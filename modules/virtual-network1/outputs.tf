output "subnet_id" {
    description = "id of the subnet"
    value = azurerm_subnet.subnet.id
}

output "vnet_id1" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name1" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.vnet.name
}
