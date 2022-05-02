
# Network interface of VM

resource "azurerm_network_interface" "myvm1nic"   { 
   name                    =   "myvm1-nic" 
   location                =   "eastus" 
   resource_group_name     =    var.resource_group_name 

   ip_configuration   { 
     name                            =   "ipconfig1" 
     subnet_id                       =   azurerm_subnet.frontendsubnet.id 
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id            =   azurerm_public_ip.myvm 1 publicip.id 
   } 
 }

# Public IP for VM
resource   "azurerm_public_ip"   "myvm1publicip"   { 
   name                   =   "pip1" 
   location               =   "eastus" 
   resource_group_name    =   var.resource_group_name 
   allocation_method      =   "Dynamic" 
   sku                    =   "Basic" 
 }

# The VM

resource   "azurerm_windows_virtual_machine"   "example"   { 
   name                    =   "myvm1"   
   location                =   "northeurope" 
   resource_group_name     =   azurerm_resource_group.rg.name 
   network_interface_ids   =   [ azurerm_network_interface.myvm 1 nic.id ] 
   size                    =   "Standard_B1s" 
   admin_username          =   "adminuser" 
   admin_password          =   "Password123!" 

   source_image_reference   { 
     publisher   =   "MicrosoftWindowsServer" 
     offer       =   "WindowsServer" 
     sku         =   "2019-Datacenter" 
     version     =   "latest" 
   } 

   os_disk   { 
     caching             =   "ReadWrite" 
     storage_account_type   =   "Standard_LRS" 
   } 
 }

