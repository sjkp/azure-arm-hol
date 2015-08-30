#Deployment
##Deploy Resource Group
### PowerShell
In order to deploy the resource group you need to open a Azure PowerShell and run the following commands, when located in the directory that contains your template and vm.param.json file.

Note if you haven't deleted the resource group from last step you can apply the template to the existing resource group and only get the changes added to the resource group.
```powershell
Add-AzureAccount
Switch-AzureMode AzureResourceManager
New-AzureResourceGroup -Name "mytestgroup" -Location westeurope -TemplateParameterFile .\vm.param.json -TemplateFile .\vm.json
```

When the DSC extension gets added successfully you can to browse the website on http://<dnsNameForPublicIP>.<location>.cloudapp.azure.com/

###Remove Resource Group
If a deploy fails or you want to clean up, you can remove the resource group including everything within it, with the following command
```powershell
Remove-AzureResourceGroup -Name "mytestgroup"
```

