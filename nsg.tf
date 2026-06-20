resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsg
  name = each.value.name
  location = each.value.location
  resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
  dynamic "security_rule"{
    for_each = var.nsgrule
    content {
    name = security_rule.value.name
    priority = security_rule.value.priority
    direction = security_rule.value.direction
    access = security_rule.value.access
    protocol = security_rule.value.protocol
    source_port_range = security_rule.value.source_port_range
    destination_port_range = security_rule.value.destination_port_range
    source_address_prefix = security_rule.value.source_address_prefix
    destination_address_prefix = security_rule.value.destination_address_prefix
  }
}
}

resource "azurerm_subnet_network_security_group_association" "asso1" {
  for_each = var.nsgasso
  subnet_id = azurerm_subnet.sb1[each.value.subnet_id].id
    network_security_group_id = azurerm_network_security_group.nsg[each.value.network_security_group_id].id
}
resource "azurerm_network_security_group" "nsg1" {
  for_each = var.nsg1
  name = each.value.name
  location = each.value.location
  resource_group_name = azurerm_resource_group.nimbu1[each.value.resource_group_name].name
dynamic "security_rule"  {
   for_each = var.nsgrule1
   content {
     name = security_rule.value.name
     priority = security_rule.value.priority
     direction = security_rule.value.direction
     access = security_rule.value.access
     protocol = security_rule.value.protocol
     source_port_range = security_rule.value.source_port_range
     destination_port_range = security_rule.value.destination_port_range
     source_address_prefix = security_rule.value.source_address_prefix
     destination_address_prefix = security_rule.value.destination_address_prefix
   }
}
}

resource "azurerm_subnet_network_security_group_association" "asso2" {
  for_each = var.nsgasso2
  subnet_id = azurerm_subnet.sb2[each.value.subnet_id].id
network_security_group_id = azurerm_network_security_group.nsg1[each.value.network_security_group_id].id
}



