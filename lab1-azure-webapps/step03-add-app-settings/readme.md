#Step 3 - Add App Settings
In this step we will learn how to add application settings from our templates. We are going to add app settings to both Microsoft.Web/sites resources and to slots. 

##How to
The schema for appsettings are specified in the ARM schemas located at https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Web.json#L75-L103 

So the type of the resource have to be "config" or "Microsoft.Web/sites/config" and the name have to be "appsettings". You specify the settings in the properties property, following this schema https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Web.json#L207-L220 

##Deployment
[Deployment Guide](../../docs/deployment.md)   