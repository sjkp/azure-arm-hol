# Setup IIS with DSC (Desired State Configuration)
To configure the Virtual Machine after is has been provisioned we can use DSC. DSC is added to the machine in the same way as you just added the Symantec Endpoint Protection via a VM extension.

The desired state config file we are going to use is quite simple. It looks like this
```
Configuration azuredkwebsite
{
  param ($MachineName)

  Node $MachineName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = "Present"
      Name = "Web-Server"
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure = "Present"
      Name = "Web-Asp-Net45"
    }

     WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }
  }
} 
```
Note the DSC file have to be placed in a zip file that must be uploaded somewhere so the DSC extension can download and install it on the machine. For this step you can use the provided zip file or you can try to upload one of your own.

We will use the same template as in the last step with just an extra resource added that namely the DSC VM extension. 

You can find the information for the DSC VM extension in https://gist.github.com/sjkp/0432b055400b3c3c4504. 

Note that the DSC extension does require a settings object, the settings object have the following structure
```
{
  "ModulesUrl": "", //The url to the zip file containing the DSC module
  "SasToken": "", //SAS token if the DSC is stored in a protected blob storage
  "ConfigurationFunction": "", //The function to call, in the format azuredkwebsite.ps1\\azuredkwebsite
  "Properties": {
    "MachineName": "" //Any properties that the DSC might need
  }
}
``` 
## Provision the resource group
### PowerShell
In order to provision the resource group you need to open a Azure PowerShell and run the following commands, when located in the directory that contains your template and vm.param.json file.

Note if you haven't deleted the resource group from last step you can apply the template to the existing resource group and only get the DSC Extension added to the virtual machine.
```
Add-AzureAccount
Switch-AzureMode AzureResourceManager
New-AzureResourceGroup -Name "mytestgroup" -Location westeurope -TemplateParameterFile .\vm.param.json -TemplateFile .\vm.json
```

When the extension gets added successfully you can to browse the default IIS website on http://<dnsNameForPublicIP>.<location>.cloudapp.azure.com/


##Remove the extension
If the installation of the extension fails and you want to try over you can completely remove it from the VM using the following command
```
Remove-AzureVMDscExtension -ResourceGroupName mytestgroup -VMName azuredkvm -Name <name-of-dsc-extension>
```