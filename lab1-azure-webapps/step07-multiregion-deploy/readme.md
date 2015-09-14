#Step 7 - Multiregion Deploy
In this step we will look into how we can extend the template we already have to deploy our site to mulitple geographical regions. 

This can e.g. be beneficial if you have customers from different parts of the world and you want to utilize Azure Trafic Manager to route your customers to a web app hosted in Azure data center close to them.

##How to  
In order to deploy the site to multiple regions, we first need to define which regions we are interested in. 

We can do that by creating a parameter that is an array of string with the region names. Use the following to get the resource locations 
```PowerShell
Get-AzureLocation | ogv
```

When we have that in place we can use the copy property on a resource
```json
"copy": {
    "name": "copyName",
    "count": "[parameters('numberOfSites')]"
}
```
and [copyIndex](../../docs/arm-template-functions.md#copyindex) function to make multiple instaces of a resource, 
in our template without having to do copy paste. 

To get the length of the array you can use [length](../../docs/arm-template-functions.md#length) function

You might also need to use the [replace](../../docs/arm-template-functions.md#replace) function to get rid of spaces in the region names. 