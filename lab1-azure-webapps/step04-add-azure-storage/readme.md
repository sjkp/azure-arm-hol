#Step 4 - Add Azure Storage Account
In this step we will create an Azure Storage Account and add the connection string to it to the web application. 

This can e.g. be useful if you web application is dependent on Azure Storage or you use web jobs, that require a Azure Storage Account for loggin.

##How to 
To create a Azure Storage Account we need to familiarize ourselves with the schema for the resource 
type [Microsoft.Storage/storageAccounts](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Storage.json)

To get the storage account key and insert it into a connection string we need to use the [listKeys](../../docs/arm-template-functions.md#listKeys) function supported in ARM templates. 