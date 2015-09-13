#Step 6 - Add Github Integration
In this step we will look into how you can setup continues integration from Github. 

With continous integration configured the KUDU service running on the Azure Web App will register a web hook with github and on every push the github repo trigger a new build to the Azure Web App. 

You can use this to automatically deploy to e.g. the staging slot, do you verification and then manually/or automatic swap the staging into the production slot. 

In this step we will just deploy directly to the production slot - like a [boss](https://www.youtube.com/watch?v=IkTw7J-hGmg)! 

#How to
Again the documentation about the resource needed to do continues deployment are pretty limited. But basically you need to add a resource to the web app or slot that have the following schema.
```json
{
	"apiVersion": "2015-04-01",
    "name": "web",
    "type": "sourcecontrols",	
	"properties": {
		"RepoUrl": "[parameters('repoUrl')]",
		"branch": "[parameters('branch')]"
	}
}
```
Repo url is the git link to the repository e.g. https://github.com/azuredk/azure-arm-hol.git. 
Branch is the branch you want to deploy from. 

Another thing that is nice to know is that if you solution file is not located in the root, of you repo, you can point to it by setting an app setting with the key "PROJECT". 

For this step, you can use the web project that we also use in the Virtual Machine lab, it's located in "lab2-azure-virtualmachines\step05-deploy-sample-website-to-iis\complete\azuredkwebsite"
