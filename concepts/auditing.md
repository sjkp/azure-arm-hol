#Auditing
Everything action that is carried out by the Azure Resource Manager control plane is logged. This audit log can be access from either the new azure portal https://portal.azure.com, from PowerShell or the REST API. 

![The Audit Log can be opened from under Notifications](https://github.com/sjkp/azure-arm-hol/raw/master/concepts/img/azure-audit-log.png)

The interresting PowerShell commands are: 
| Command                          	| Description
| :-------------------------------: | :----------
| Get-AzureSubscriptionIdLog        | Gets the operations associated with the current subscriptionId
| Get-AzureResourceProviderLog		| Gets the operations associated with a Resource Provider
| Get-AzureResourceLog				| Gets the operations associated with a ResourceId 	
| Get-AzureResourceGroupLog			| Gets the deployment log for a resource group
| Get-AzureCorrelationIdLog 		| Gets the operations associated with a CorrelationId.

	