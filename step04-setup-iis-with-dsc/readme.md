# Setup IIS with DSC (Desired State Configuration)
To configure the Virtual Machine after it has been provisioned we can use DSC. DSC is added to the machine via a VM extension.

The desired state config file we are going to use is quite simple. It looks like this
```powershell
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
The DSC file have to be added to a zip file that must be uploaded somewhere so the DSC extension can download and install it on the machine. For this step you can use the provided zip file or you can try to upload one of your own.

We will use the same template as in the last step with an extra resource added, namely the DSC VM extension. 

You can find the information for the DSC VM extension in https://gist.github.com/sjkp/0432b055400b3c3c4504. 

Note that the DSC extension does require a settings object, the settings object have the following structure
```json
{
  "ModulesUrl": "", //The url to the zip file containing the DSC module
  "SasToken": "", //SAS token if the DSC is stored in a protected blob storage
  "ConfigurationFunction": "", //The function to call, in the format azuredkwebsite.ps1\\azuredkwebsite
  "Properties": {
    "MachineName": "" //Any properties that the DSC might need
  }
}
``` 
## Deployment
[Deployment Guide](../docs/deployment.md)

###Remove the VM DSC Extension
If the installation of the VM DSC extension fails and you want to try over you can completely remove it from the VM using the following command
```
Remove-AzureVMDscExtension -ResourceGroupName mytestgroup -VMName azuredkvm -Name <name-of-dsc-extension>
```

## Extra Challenges
If you need some extra challenges, try to see if you can do the following (note there is no answer on how to do this):
- Upload the zip containing the DSC to Azure blob storage an use a SAS token to avoid it being accessible to everyone