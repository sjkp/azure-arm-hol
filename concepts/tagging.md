# Tagging
All resources and resource groups can have tags associated. You can add up to 15 tags to any single resource. A tag is a single key value pair. 

Tags can be used for whatever you see fit, some ideas could be. 
- Use it to define if an resource is for dev, test, qa or prod (if you have all in same subscription)
- Use it to define responsible for a resource 
- Use it to define department (tags are now also visible from billing)

## How to add tags
You can easily add tags to resources when you author your ARM templates, adding a tag to a resource is as simple as 
```json
{
        "apiVersion": "2015-05-01-preview",
        "type": "Microsoft.Storage/storageAccounts",
		"location": "[variables('location')]",
		"name": "[parameters('newStorageAccountName')]",
		"tags": {
			"Owner": "Bob John", 
			"Environment": "QA"
			}
		"properties": {
                "accountType": "[parameters('storageAccountType')]"
		}
},
```

Or you can use the following PowerShell Commands
```powershell
#Create a new tag
New-AzureTag -Name MyTag
#Create a new tag with a value
New-AzureTag -Name Department -Value HR 
#Set the tag on a resource group (note you don't have to create the tag first)
Set-AzureResourceGroup -Name "<resource-group-name>" -Tags @{Name="Environment";Value="Test"}
#Get all resource with a specific tag
Get-AzureResourceGroup -Tag @{Name="Environment";Value="Test"}
```
Note that just like you can set tags on resource groups you can also set them on individual resources. Tags set on the resource group are not inherited by the resources belonging to it. 
