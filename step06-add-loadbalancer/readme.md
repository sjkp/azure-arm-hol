# Add loadbalancer
In this step we will add an internal load balancer in order to prepare for the next step where we are gonna deploy two web servers and load balance between them. 

This step doesn't continue directly where step 05 left off, so you have to use a new resource group or delete the old one. 

The virtual machine and the VM extensions are not deployed as part of this template. But we will add them again in the next step.

In this step we configure the following resources:
- A Storage Account
- An Availability Set (in preperation for the next step) ([Microsoft.Compute/availabilitySets](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Compute.json#L7-L33)]
- A Virtual Network
- A network interface
- A load balancer ([Microsoft.Network/loadBalancers](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Network.json#L500-L556))

Only the availability set and load balancer are new resources we need to get familiar with, the other resources we have already configured before. 

## Load balancer
The load balancer resource should be dependent on the virtual network. 

## Deployment
[Deployment Guide](../docs/deployment.md)