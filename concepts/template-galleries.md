#Template Galleries
Building a template from scratch, it often not necessary as many templates exists for the most standard resource combinations. 

The following github repo, consists of a number of quick start templates https://github.com/Azure/azure-quickstart-templates. 

Besides github you can also download templates from within PowerShell with the following cmdlet
```PowerShell
Swith-AzureMode AzureResourceManager
Get-AzureResourceGroupGalleryTemplate
``` 
You can download the individual templates with 
```Powershell
Save-AzureResourceGroupGalleryTemplate
```
Unfortunately many of the templates are empty when you download them (look for the ones with ARM in their name they are good), so they can not all be used for inspiration.

To download all of Microsofts templates you can use
```powershell
Get-AzureResourceGroupGalleryTemplate -Publisher "Microsoft" |% { Save-AzureResourceGroupGalleryTemplate $_.Identity}
```
Or check them out here: https://github.com/sjkp/azure-gallery-templates/

 