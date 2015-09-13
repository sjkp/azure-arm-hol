#Step 2 - Add Deployment Slots
One of the cool features of Azure Web Apps is the support for deployment slots. A deployment slot is basically a copy of you website, with all resource and the settings you want copied that you can use for e.g. testing or QA purposes. Once you are statisfied with your testing you can use swap the content of a slot with another slot. Slots can also be used for A-B testing, as it can be configured that a percentage of the traffic should be routed to a specific slot. 

Note, slots are only supported on Basic plan and upwards.

The task in this step, is to add a staging slot to our web application, for that to be possible we need to change the SKU of the app service plan to a Standard or higher.   

##How to 
Unfortunately the documentation of the ARM templates are still lacking, for the slots specifically they are not even listed in the Schemas at https://github.com/Azure/azure-resource-manager-schemas/.
A few resources that can help you solve this step: 

- Use [Azure Resoruce Manager Explorer](../../concepts/azure-resource-explorer.md) (thus you create a slot via the portal first and see what json gets generated with the tool)
- Use google and try to find some examples, for this specific step, David Ebbo (Azure Program Manager) has a great example in his github https://github.com/davidebbo/AzureWebsitesSamples/blob/master/ARMTemplates/TodoApp.json
-  
