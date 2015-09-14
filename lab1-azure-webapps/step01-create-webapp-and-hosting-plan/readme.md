# Step 1 Create web app and service plan

In this step we are going to create the most basic azure website arm template
- The App service plan
- The web app 

You have to add the needed parameters (you define what you want as parameters for you template, but things like sitename, sku and location are obvious choices) and add two resources.
 - A resource of type [Microsoft.Web/Sites](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Web.json#L221-L350) for the web app
 - A resource of type [Microsoft.Web/serverfarms](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Web.json#L7-L74) for the app service plan. 

Ensure that you create the app service plan first, and that your azure web app take a dependency [dependsOn](../../docs/arm-template-functions.md#dependson) on it to ensure the correct provisioning order.

To deploy your template use either Azure PowerShell or Azure CLI, read below how to do that

## Azure PowerShell
Open Azure PowerShell
```powershell
Switch-AzureMode AzureResourceManager
Add-AzureAccount
New-AzureResourceGroup -Name azuredktest -Location westeurope -TemplateParameterFile .\website.param.dev.json -TemplateFile .\website.json
```

## Azure CLI
Open Azure CLI
```
azure login
azure config mode arm
azure group create -n azuredktest -l westeurope -f website.json -e website.param.dev.json -d azuredktest
azure group deployment show azuredktest
```

Alternatively, you can click this button, to be taken to the Azure portal and do the deployment from there (then you will use my complete template) 
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsjkp%2Fazure-arm-hol%2Fmaster%2Flab1-azure-webapps%2Fstep01-create-webapp-and-hosting-plan%2Fcomplete%2Fwebsite.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>