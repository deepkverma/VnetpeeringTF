virtual_network_name = "vnet-01"
resource_group_name = "VnetpeeringTF"
# resource_group_name = "terrform-demo-rg"
virtual_network_address_space = ["172.16.0.0/16"]
location = "eastus2"
subnet_name = "subnet01"
subnet_address_prefix = ["172.16.1.0/24"]

virtual_network_name2 = "vnet-02"
virtual_network_address_space2 = ["10.1.0.0/16"]
subnet_name2 = "subnet02"
subnet_address_prefix2 = ["10.1.0.0/24"]