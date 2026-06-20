resource "azurerm_resource_group" "nimbu1" {
  for_each = var.nimbu
  name = each.value.name
  location = each.value.location
}

