output "lb_id" {
  value       = azurerm_lb.this.id
  description = "Load Balancer id"
}

output "lb_frontend_ip_configuration" {
  value       = azurerm_lb.this.frontend_ip_configuration
  description = "List of objects with frontend ip configuration of Load Balancer"
}

output "lb_private_ip_address" {
  value       = azurerm_lb.this.private_ip_address
  description = "The first private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any."
}

output "lb_public_ip_addresses" {
  value       = azurerm_lb.this.private_ip_addresses
  description = "The list of private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any."
}

output "lb_backend_address_pool_id" {
  value       = azurerm_lb_backend_address_pool.this.id
  description = "The ID of the Backend Address Pool."
}
