# Create a Virtual Windows Machine part 1

In the first step we are going to prepare an azure resource group for provisioning of Windows Server 2012R2 from an Azure Resource Manager template. 

This first step is purposedly split in two, as provisioning a machine takes a several minutes, so making sure part 1 works before moving to part 2 will save you some time. 

In the step 1 we will create four of the five different resources needed to create a virtual machine.  

The five resources we need to provision a VM are:

- A storage acount ([Microsoft.Storage/storageAccounts](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Storage.json))
- A public ip address ([Microsoft.Network/publicIPAddresses](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Network.json#L24-L58)
- A virtual network ([Microsoft.Network/virtualNetworks](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Network.json#L209-L248))
- A network interface, nic, ([Microsoft.Network/networkInterfaces](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Network.json#L107-L159))
- A virtual machine (part 2)

The first three resource have no dependencies, and can be deployed without using the "dependsOn" property. While The network interface will depend on the public ip and the virtual network. 

The hands-on lab starting template will encourage you to use variables, for some of the properties to avoid having too many parameters.

The starting template is missing a lot of pieces, your task is to use the schemas linked to above to fill in the missing pieces. Two tips for reading the schemas

## Check if a property is required
```
        "subnetProperties": {
            "properties": {
                "addressPrefix": {
                    "type": "string"
                },
                "networkSecurityGroup": {
                    "$ref": "#/definitions/id"
                },
                "ipConfigurations": {
                    "type": "array",
                    "items": {
                        "$ref": "#/definitions/id"
                    }
                }
            },
            "type": "object",
            "required": [
                "addressPrefix"
            ]
        }
```
From the above schema definition for properties of a subnet, it can be seen that the only required property is the addressPrefix, networkSecurityGroup and ipConfigurations can be left out. 

## Follow the $ref
The schemas makes heavy use of references, so when you encounter, e.g.
```
 	 "$ref": "#/definitions/subnetProperties"
``` 
Just find where the subnetProperties is defined to figure out what properties are available.  

## Deployment
[Deployment Guide](../docs/deployment.md)   
