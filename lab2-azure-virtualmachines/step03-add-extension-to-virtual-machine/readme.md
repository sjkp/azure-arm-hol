# Add Extension to Virtual Machine
In this step we will look into how to add a VM extension to a virtual machine.

The schema we need to get familiar with are the [Microsoft.Compute/virtualMachines/extensions](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Compute.json#L422-L463)

The extensions I have choosen to install is Symantec Endpoint Protection but feel free to pick one of your own. (Note some extensions have settings, you should be able to get them from the publisher of the extension). 

## How to get a list of extensions 
To get a list of extension that you can choose to install use the following PowerShell Commands from an azure powershell (note this scripts takes a while, as it goes through all publisher and lists all extensions)

A compiled list generated 22-08-2015 can be found here https://gist.github.com/sjkp/0432b055400b3c3c4504
```powershell
Switch-AzureMode AzureResourceManager
$location = "West Europe"
Get-AzureVMImagePublisher -Location $location | Select PublisherName |% {
	$publisher =  $_.PublisherName
	Get-AzureVMExtensionImageType -Location $location -Publisher $publisher |% {
		Get-AzureVMExtensionImage -Location $location -Publisher $publisher -Type $_.Type
	}
}

```

##Problems with the installation
If you encounter problems during the installation of the VM Extension, you can either visit the audit log in the new [azure portal](https://portal.azure.com) or you can RDP into the machine and look in C:\Packages\Plugins\<name-of-extension>\\<version> is this folder you will find all files and logs related to the VM extension. 


## Deployment
[Deployment Guide](../../docs/deployment.md)   

To check if the VM Extension is properly installed you can use the following command
```powershell
Get-AzureVMExtension -ResourceGroupName "mytestgroup" -VMName "azuredk" -Name "<name-of-extension>"
```