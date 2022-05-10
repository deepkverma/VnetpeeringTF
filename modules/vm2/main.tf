
# Network interface of VM
resource "azurerm_network_interface" "myvm2nic"   { 
   name                    =   "myvm2-nic" 
   location                =   "eastus" 
   resource_group_name     =    var.resource_group_name 

   ip_configuration   { 
     name                            =   "ipconfig1" 
     subnet_id                       =    var.subnet2id
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id            =   azurerm_public_ip.myvm2publicip.id 
   } 
 }

# Public IP for VM
resource   "azurerm_public_ip"   "myvm2publicip"   { 
   name                   =   "pip2" 
   location               =   "eastus" 
   resource_group_name    =   var.resource_group_name 
   allocation_method      =   "Dynamic" 
   sku                    =   "Basic" 
 }

# The VM

resource   "azurerm_windows_virtual_machine"  "vm2"   { 
   name                    =   "myvm2"   
   location                =   "eastus" 
   resource_group_name     =   var.resource_group_name 
   network_interface_ids   =   [ azurerm_network_interface.myvm2nic.id ] 
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

