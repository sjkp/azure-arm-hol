# Create a Virtual Windows Machine part 1

In the first step we are going to prepare an azure resource group for provisioning of Windows Server 2012R from an Azure Resource Manager template. 

This hands-on lab is purposedly split in two, as provisioning a machine takes a several minutes, so making sure part 1 works before moving to part 2 will save you some time. 

In the prepration step we will create four of the five different resources needed to create a virtual machine.  

The five resources we need to provision a VM are:

- A storage acount ([Microsoft.Storage/storageAccounts](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Storage.json))
- A public ip address ([Microsoft.Network/publicIPAddresses](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Network.json#L24-L58)
- A virtual network ([Microsoft.Network/virtualNetworks](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Network.json#L209-L248))
- A network interface, nic, ([Microsoft.Network/networkInterfaces](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Network.json#L107-L159))
- A virtual machine (part II)

The first three resource have no dependencies, and can be deployed without using the "dependsOn" property. While The network interface will depend on the public ip and the virtual network. And finally the virtual machine will depend on the nic and the storage account.

The hands-on lab starting template will encourage you to use variables, for some of the properties to avoid having too many parameters.

The starting template is missing a lot of pieces, you task is to use the schemas linked to above to fill in the missing pieces. Two tips for reading the schemas

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



## Provision the resource group
### PowerShell
In order to provision the resource group you need to open a Azure PowerShell and run the following commands, when located in the directory that contains your template and vm.param.json file.
```
Add-AzureAccount
Switch-AzureMode AzureResourceManager
New-AzureResourceGroup -Name "mytestgroup" -Location westeurope -TemplateParameterFile .\vm.param.json -TemplateFile .\vm.json
```

If the deploy fails or you want to clean up, you can remove the resource group including everything within it, with the following command
```
Remove-AzureResourceGroup -Name "mytestgroup"
```