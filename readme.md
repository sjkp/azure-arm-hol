#Azure Resource Manager Templates Hands-on Labs
These hands-on labs are designed to help you get familiar with Azure Resource Manager.

#Prerequisites
Before you can complete the labs you need a few things
- [Azure PowerShell](https://github.com/Azure/azure-powershell/releases)
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
- [Presentation](https://github.com/sjkp/azure-arm-hol/raw/master/presentation/Azure%20Resource%20Manager.pptx)
- [Getting Started With Azure PowerShell](docs/getting-started-with-azure-powershell.md)
- [Azure Resource Manager Concepts](concepts/readme.md)
- [Azure Resource Manager Template Functions](docs/arm-template-functions.md)

##Two labs
This hands on sessions consists of two labs
- [Azure Web Apps](lab1-azure-webapps/readme.md)
- [Azure Virtual Machines](lab2-azure-virtualmachines/readme.md)

The labs are independent, so it is up to you if you want to do both or just the one you find most interesting. 

