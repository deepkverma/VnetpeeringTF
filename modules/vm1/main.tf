
# Network interface of VM
resource "azurerm_network_interface" "myvm1nic"   { 
   name                    =   "myvm1-nic" 
   location                =   "eastus" 
   resource_group_name     =    var.resource_group_name 

   ip_configuration   { 
     name                            =   "ipconfig1" 
     subnet_id                       =    var.subnetid
     private_ip_address_allocation   =   "Dynamic" 
     public_ip_address_id            =   azurerm_public_ip.myvm1publicip.id 
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

resource   "azurerm_windows_virtual_machine"  "vm"   { 
   name                    =   "myvm1"   
   location                =   "eastus" 
   resource_group_name     =   var.resource_group_name 
   network_interface_ids   =   [ azurerm_network_interface.myvm1nic.id ] 
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

