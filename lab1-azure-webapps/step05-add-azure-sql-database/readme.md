#Step 5 - Add Azure SQL Database 
In this step, we are going to add more resources to our resource group. This time it will be an Azure SQL Database. 

In order to provision an Azure SQL database an Azure SQL server is required, so we need to create two new resources. 

Futhermore when the resources are deployed we want to add a connection string to our web app that points to the new database. 


##How to
We need to add following resources
- A SQL database server [Microsoft.Sql/servers](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2014-04-01-preview/Microsoft.Sql.json#L7-L70) 
- A SQL database as a resource of the server [Microsoft.Sql/servers/databases](https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2014-04-01-preview/Microsoft.Sql.json#L294-L316)

We are going to use the new V12.0 databases, which requires us to set the correct properties of the SQL server. 

In order to add the connection string we need to use the connectionstring resource type (which works much like the appsetting resource type used earlier.
https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2015-08-01/Microsoft.Web.json#L167-L206

Another thing we have to remember is to configure the firewall for the SQL server (https://github.com/Azure/azure-resource-manager-schemas/blob/master/schemas/2014-04-01-preview/Microsoft.Sql.json#L330-L352). 
In order for the SQL server to be accessible from other Azure services we need to open 0.0.0.0.
 
##Deployment
[Deployment Guide](../../docs/deployment.md)    


