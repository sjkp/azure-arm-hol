# Resource Linking
As your ARM deployments get more complex, it might be helpful to provide links between resources. The links will show up in portal.azure.com but they can also be used to query resource by. 

A link between resources can be used to create a relationship between resources in different resource groups (note the link doesn't create a strict dependency, so you can still delete a resource linked to by another resource, and then you have to clean up the link).

A link is created just as you add any other resource to your template e.g. 
```json
{
    "apiVersion": "2015-01-01",
    "type": "providers/links",
    "name": "Microsoft.Resources/mobile-sqldb",
	"dependsOn": [
    	"[resourceId('Microsoft.AppService/apiapps', parameters('$system').apiAppName)]"
    ],
	"properties": {
		"targetId": "[concat('/subscriptions/', parameters('userDatabase').subscriptionId, '/resourcegroups/', parameters('userDatabase').resourceGroupName, '/providers/Microsoft.Sql/servers/', parameters('userDatabase').serverName, '/databases/', parameters('userDatabase').databaseName)]"
	}
}
```
For more information check this article: https://azure.microsoft.com/en-us/documentation/articles/resource-group-link-resources/ 
  