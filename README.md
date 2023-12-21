# Azure Load Balancer Terraform module
Terraform module for creation Azure Load Balancer

## Usage
This module is creating Azure Load Balancer.
```hcl

```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version   |
|---------------------------------------------------------------------------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 3.75.0 |

## Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.75.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                | Type     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_lb.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb)                                                               | resource |
| [azurerm_lb_backend_address_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool)                     | resource |
| [azurerm_lb_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule)                                                     | resource |

## Inputs

| Name                                                                                                                                                                | Description                                                                                                                                                                             | Type           | Default                                                                                                                                                         | Required |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group)| The name of the resource group. | `string`| n/a |   yes    |
| <a name="input_location"></a> [location](#input\_location)| The Azure Region in which all resources in this example should be created. | `string`| n/a |   yes    |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name)| Specifies the name of the Load Balancer. Changing this forces a new resource to be created. | `string`| n/a |   yes    |
| <a name="input_backend_pool_name"></a> [backend\_pool\_name](#input\_backend\_pool\_name)| Specifies the name of the Backend Address Pool. Changing this forces a new resource to be created. | `string`| BackEndAddressPool |   no    |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(string)`  | {} |    no    |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic. Changing this forces a new resource to be created. | `string` | Standard |    no    |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional. Changing this forces a new resource to be created. | `string` | Regional |    no    |
| <a name="input_backend_pool_vnet_id"></a> [backend\_pool\_vnet\_id](#input\_backend\_pool\_vnet\_id) | The ID of the Virtual Network within which the Backend Address Pool should exist. | `string` | null |    no    |
| <a name="input_lb_frontend_ip_configurations"></a> [lb\_frontend\_ip\_configurations](#input\_lb\_frontend\_ip\_configurations)| List of object with configuration parameters to create Load Balancer frontend ip configurations and rules |  <pre>list(object({<br>  name                 = string<br>  subnet_id            = optional(string)<br>  public_ip_address_id = optional(string)<br>  public_ip_prefix_id  = optional(string)<br>  rules = optional(list(object({<br>    name               = string<br>    protocol           = string<br>    frontend_port      = number<br>    backend_port       = number<br>    load_distribution  = optional(string)<br>    enable_floating_ip = optional(bool)<br>  })), [])<br>}))</pre> | [] |   no    |


## Outputs

| Name                                                                                                                | Description                                   |
|---------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id)                                                                          | Load Balancer id   |
| <a name="output_lb_frontend_ip_configuration"></a> [lb_frontend\_ip\_configuration](#output\_lb_frontend\_ip\_configuration) | List of objects with frontend ip configuration of Load Balancer |
| <a name="output_lb_private_ip_address"></a> [lb\_private\_ip\_address](#output\_lb\_private\_ip\_address)  | The first private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any. |
| <a name="output_lb_public_ip_addresses"></a> [lb\_public\_ip\_addresses](#output\_lb\_public\_ip\_addresses)  | The list of private IP address assigned to the load balancer in frontend_ip_configuration blocks, if any.|
| <a name="output_lb_backend_address_pool_id"></a> [lb\_backend\_address\_pool\_id](#output\_lb\_backend\_address\_pool\_id)    | The ID of the Backend Address Pool. |

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-azurerm-load-balancer/blob/main/LICENSE)
