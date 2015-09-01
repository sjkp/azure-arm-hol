#Azure Resource Manager Templates Hands-on Labs
These hands-on labs are designed to help you get familiar with Azure Resource Manager.

#Prerequisites
Before you can complete the labs you need a few things
- [Azure PowerShell](http://go.microsoft.com/fwlink/p/?linkid=320376&clcid=0x406)
- [An Azure Subscription](https://azure.microsoft.com/) (a trial account is fine)
- [Visual Studio Code](https://code.visualstudio.com/) (or another text editor capable of highligting JSON, for you own sake don't use notepad)

#The structure
The labs are organized in steps. The steps are meant to be completed from the first to the last. Each step contains a readme.md file that describes what the step is about, and two folders:
- begin
- complete

The begin folder contains a starting template that can be used to help you get started. The template contains comments // sometimes with links to help you along.

If you get stuck or just want inspiration the complete folder contains one possible solution to the task. 

Please note that if you try to run the complete solution with the provided *.param.json files you might encounter errors if other people have deployed resources with the same names, so you should always update the names to be unique.  

##Before you start
The following resource can help you get started
- [Presentation](presentation/Azure Resource Manager.pptx)
- [Getting Started With Azure PowerShell](docs/getting-started-with-azure-powershell.md)
- [Azure Resource Manager Concepts](concepts/readme.md)
- [Azure Resource Manager Template Functions](docs/arm-template-functions.md)

If you need ti

##Virtual Machines Lab
The Virtual Machine lab contains serveral task that will teach you how to provision Azure VMs by using Azure Resource Manager (ARM) Templates.
- [Step 01 - Create a Virtual Machine Part 1](step01-create-a-virtual-machine-part1/readme.md)
- [Step 02 - Create a Virtual Machine Part 2](step02-create-a-virtual-machine-part2/readme.md)
- [<s>Step 03 - Add Extension to Virtual Machine</s> (skip this one)](step03-add-extension-to-virtual-machine/readme.md)
- [Step 04 - Setup IIS with DSC](step04-setup-iis-with-dsc/readme.md)
- [Step 05 - Deploy Sample Website to IIS](step05-deploy-sample-website-to-iis/readme.md)
- [Step 06 - Add Loadbalancer](step06-add-loadbalancer/readme.md)
- [Step 07 - Add Multiple Loadbalanced Web Servers](step07-add-multiple-loadbalanced-web-servers/readme.md)

