# Sub Templating
When composing large deployments with ARM templates, it can be usefull to be able to split the template files into smaller resuable modules. 

That is possible with ARM as you can have a resource that links to a sub template, just as well as you can link to parameter files. 

There is one catch though, when you start linking to other templates, then these sub templates have to be accessible over the internet, so the ARM service plane can download them. 

This article describes how to get started: https://azure.microsoft.com/en-us/documentation/articles/resource-group-linked-templates/ 