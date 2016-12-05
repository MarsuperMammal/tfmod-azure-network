Azure Network Terraform Module
===========

A terraform module to provide a network in Microsoft Azure.


Module Input Variables
----------------------

- `location` - azure location
- `network_addr_space` - network cidr block
- `network_name` - network name
- `pub_subnet_num` - number of public subnets
- `rgroup_name` - resource group name
- `subnet_bit` - bit offset for subnet size

Usage
-----

```hcl
module "network" {
  source = "github.com/marsupermammal/tfmod-azure-network"
  location = "eastus"
  rgroup_name = "my_resource_group"
  network_addr_space = "10.0.0.0/16"
  network_name = "my_network"
  pub_subnet_num = "1"
  subnet_bit = "8"
}
```

Outputs
-----

 - `network_id` - virtual network id
 - `pub_subnets` - list of public subnet

Author
=======

Originally created and maintained by [Phil Watts](https://github.com/)

License
=======

Apache 2 Licensed. See LICENSE for full details.
