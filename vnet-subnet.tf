resource "azurerm_virtual_network" "vnet1" {
  for_each = var.vnet
  name = each.value.name
  location = each.value.location
resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
address_space = each.value.address_space
}
resource "azurerm_virtual_network" "vnet2" {
  for_each = var.vnet3
  name = each.value.name
  location = each.value.location
resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
address_space = each.value.address_space
}
resource "azurerm_subnet" "sb1" {
    for_each = var.sb
    name = each.value.name
 resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
    virtual_network_name = azurerm_virtual_network.vnet1[each.value.virtual_network_name].name
    address_prefixes = each.value.address_prefixes
}
resource "azurerm_subnet" "sb2" {
    for_each = var.sb3
    name = each.value.name
   resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
  virtual_network_name = azurerm_virtual_network.vnet2[each.value.virtual_network_name].name
    address_prefixes = each.value.address_prefixes
}
