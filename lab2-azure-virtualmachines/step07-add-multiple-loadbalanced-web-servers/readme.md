# Add Multiple Load Balanced Web Servers
In this step, we will add two web servers to the load balancer we created in step 6. 

To avoid copy pasting too much we will use the copy functionality that are supported in ARM templates. 

To make a copy of resource the template could look like this:
```
{
	"apiVersion": "2015-05-01-preview",
	"type": "Microsoft.Storage/storageAccounts",
	"location": "[variables('location')]",
    "name": "[concat(parameters('newStorageAccountName'),copyIndex())]",
    "copy": {
    	"name": "loop",
		"count": 3
	},
    "properties": {
		"accountType": "[parameters('storageAccountType')]"
	}
}
``` 
The copy object defines the name of the loop and the amount of time the resource should be copied. The copyIndex() function is used to get the current iteration of the loop.

You can also use copyIndex(1) if you want to offset the index, copyIndex() starts with 0 while copyIndex(1) starts at 1. 

The task in this step is to use the copy functionality to copy the nics and the virtual machine resources. You can reuse the virtual machine part of template from step 5.

#Virtual Machine Sizes
Remember that load balacing are only supported by Standard VMs not Basic. 

## Deployment
[Deployment Guide](../../docs/deployment.md)