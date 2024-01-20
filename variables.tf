variable "resource_group" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
}

variable "load_balancer_name" {
  type        = string
  description = "Specifies the name of the Load Balancer. Changing this forces a new resource to be created."
}

variable "backend_pool_name" {
  type        = string
  default     = "BackEndAddressPool"
  description = "Specifies the name of the Backend Address Pool. Changing this forces a new resource to be created."
}

variable "tags" {
  type        = map(any)
  description = "Resource tags"
  default     = {}
}

variable "sku" {
  type        = string
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic. Changing this forces a new resource to be created."
  default     = "Standard"
}

variable "sku_tier" {
  type        = string
  description = "The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional. Changing this forces a new resource to be created."
  default     = "Regional"
}

variable "backend_pool_vnet_id" {
  type        = string
  description = "The ID of the Virtual Network within which the Backend Address Pool should exist."
  default     = null
}

variable "lb_frontend_ip_configurations" {
  description = "List of object with configuration parameters to create Load Balancer frontend ip configurations and rules"
  type = list(object({
    name                 = string
    subnet_id            = optional(string)
    public_ip_address_id = optional(string)
    public_ip_prefix_id  = optional(string)
    rules = optional(list(object({
      name               = string
      protocol           = string
      frontend_port      = number
      backend_port       = number
      load_distribution  = optional(string, "Default")
      enable_floating_ip = optional(bool, false)
    })), [])
  }))
  default = []
}

variable "diagnostic_settings_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting"
  default     = null
}

variable "enable_diagnostic_setting" {
  type        = bool
  description = "Enable diagnostic setting. var.analytics_workspace_id must be provided"
  default     = false
}

variable "analytics_workspace_id" {
  type        = string
  description = "Resource ID of Log Analytics Workspace"
  default     = null
}

variable "analytics_destination_type" {
  type        = string
  description = "Possible values are AzureDiagnostics and Dedicated."
  default     = "Dedicated"
}
