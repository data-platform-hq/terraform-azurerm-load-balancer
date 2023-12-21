locals {
  frontend_ip_configuration_rules_mapped = { for object in flatten([for config in var.lb_frontend_ip_configurations : [for rule in config.rules : {
    name = "${config.name}:${rule.name}"
    rule = rule
  }] if config.rules != null]) : object.name => object.rule }
}

resource "azurerm_lb" "this" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.sku
  sku_tier            = var.sku_tier
  tags                = var.tags

  dynamic "frontend_ip_configuration" {
    for_each = var.lb_frontend_ip_configurations
    content {
      name                 = frontend_ip_configuration.value.name
      subnet_id            = frontend_ip_configuration.value.subnet_id
      public_ip_address_id = frontend_ip_configuration.value.public_ip_address_id
      public_ip_prefix_id  = frontend_ip_configuration.value.public_ip_prefix_id
    }
  }
}

resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id    = azurerm_lb.this.id
  name               = var.backend_pool_name
  virtual_network_id = var.backend_pool_vnet_id
}

resource "azurerm_lb_rule" "this" {
  for_each = local.frontend_ip_configuration_rules_mapped

  name                           = each.value.name
  loadbalancer_id                = azurerm_lb.this.id
  frontend_ip_configuration_name = split(":", each.key)[0]
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  protocol                       = each.value.protocol
  load_distribution              = each.value.load_distribution
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
}
