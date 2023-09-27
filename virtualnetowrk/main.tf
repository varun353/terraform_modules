resource "azurerm_virtual_network" "virtual_netowrk_name" {
  for_each            = var.virtual_netowrk_name
  name                = each.value.name_vnet
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
  location            = each.value.location

subnet {
 
  name           = each.value.subnet1_name
  address_prefix = each.value.address_prefix1
}
subnet {
  name           = each.value.subnet2_name
  address_prefix = each.value.address_prefix2
}

}
#resource "azurerm_virtual_network_peering" "peering" {
 # for_each = var.virtual_netowrk_name
  #name                      = each.value.peering_name
  #resource_group_name       = each.value.rg_name
  #virtual_network_name      = each.value.name_vnet
   # remote_virtual_network_id = each.value.remote_virtual_network_id
    #depends_on = [ azurerm_virtual_network.virtual_netowrk_name ]
#}
