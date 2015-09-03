# Create a Virtual Windows Machine part 2
In this step we continue with the template we created in step 1 and add the virtual machine to it.

The begin code starts from the complete code from step 1, but feel free to continue on your own code if you want. 

To add a virtual machine to the template we need to be familiar with the [Microsoft.Compute/virtualMachines](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Compute.json) schema.

Note that you don't have to delete the resource group you created in step 1, you can just apply the same template again, the Azure Resource Manager will ensure that only added resources gets provisioned.

Remember that the virtual machine will depend on the nic and the storage account created in the previous step, so you have to use the dependOn again. 

##VM Images (osProfile)
In this step we create the virtual machine from a prepublished image, it is also possible to use a custom image (but that is for another day). 

In order to specify an image you must know the following three things
- Publisher
- Offer
- SKU 

All of these things can be found with PowerShell, from an Azure PowerShell use the following commands:
```powershell
Switch-AzureMode AzureResourceManager
$location = "West Europe"
Get-AzureVMImagePublisher -Location $location | Select PublisherName
$publisher = "MicrosoftWindowsServer"
Get-AzureVMImageOffer -Location $location -Publisher $publisher | Select Offer
$offer = "WindowsServer"
Get-AzureVMImageSku -Location $location -Publisher $publisher -Offer $offer | Select Skus
```

##VM Size (hardwareProfile)
When deploying a VM we also need to specify its size (its hardwareProfile) as the different type of machines are dependend on the location you deploy to it is relevant to use the following PowerShell commands to figure out what there is to choose from
```powershell
Switch-AzureMode AzureResourceManager
$location = "West Europe"
Get-AzureVMSize -Location $location | ogv 
``` 

## Deployment
[Deployment Guide](../docs/deployment.md)  

### Remote desktop 
You can download the remote desktop file, using the following powershell.
```Powershell
Get-AzureRemoteDesktopFile -ResourceGroupName mytestgroup -Name azuredkvm -LocalPath <folder-path>\azuredkvm.rdp
``` 

## Extra Challenges
If you need some extra challenges, try to see if you can do the following (note there is no answer on how to do this): 
- Add a data disk
- Use a custom VM image