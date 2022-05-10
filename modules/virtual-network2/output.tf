output "subnet2_id" {
    description = "id of the subnet"
    value = azurerm_subnet.subnet1.id
}

output "vnet_id2" {
  description = "The id of the newly created vNet"
  value       = azurerm_virtual_network.vnet2.id
}

output "vnet_name2" {
  description = "The Name of the newly created vNet"
  value       = azurerm_virtual_network.vnet2.name
}