# Create VNet peering VNet 1 to 2
resource "azurerm_virtual_network_peering" "peer-1-to-2" {
  name                         = "Pee1-Peer2"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.virtual_network_name1
  remote_virtual_network_id    = var.vnet_2id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}
resource "azurerm_virtual_network_peering" "peer-2-to-1" {
  name                         = "Peer2-Peer1"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = var.virtual_network_name2
  remote_virtual_network_id    = var.vnet_1id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}