#Getting Started with Azure PowerShell
This article describes how to get started with Azure PowerShell and Azure Resource Manager from PowerShell.

#The two Modes 

Managing resources in Azure, have for a while been supported by two different APIs, the Azure Service Management API and he Azure Resource Manager. 
Unfortunately the PowerShell commandlets for the two different methods of managing Azure, have a lot of overlapping names.

Because of that the Azure team orginally decided to support two different PowerShell modes, one for working with the Azure Service Management API and one for working with ARM. 

Per default when you open an Azure PowerShell prompt the commandlets for working Azure Service Management API are loaded.
Thus in order to do anything ARM related you have to switch mode with
```
#To switch to ARM mode
Switch-AzureMode AzureResourceManager
#To switch back to Service Management mode
Switch-AzureMode AzureServiceManagement
```  

From the [25/9/2015](https://github.com/Azure/azure-powershell/wiki/Deprecation-of-Switch-AzureMode-in-Azure-PowerShell) this switching back and forth between the modes will be changed, and all the cmdlets from Azure Resource Manager module will be renamed from [Verb]-Azure[Noun] to [Verb]-AzureRM[Noun]

##Authentication
###Certificate Authentication
When working with Azure you have to be authenticated. Again this can be done in different ways. Originally when Azure was release the and only the Service Management API was supported authentication would typically be done with a management certificate. 

You would have to download the certificate file with 
```
Get-AzurePublishSettingsFile
```
And import the certificate into the powershell session with 
```
Import-AzurePublishSettingsFile
```
While this is still supported when working with the Azure Service Management API, it doesn't work with ARM. 
Thus going forward, I recommend to use account authentication instead as it works with both modes.

###Account Authentication
Account authentication is accomplished by the following commandlet, which works with both Azure Service Management API and Azure Resource Manager. 
```
Add-AzureAccount
``` 

 #Unattended Authentication
 Maybe you liked the certificate authentication process because it could be used without any user interaction. 
 Of course that is also possible with the account authentication, I will show one way to accomplish this
 
 Add-AzureAccount can also be used like this, note that the credentials you are trying to authenticate with have to be an organization account, you can't use a LiveID in for this method. 
 (But even if you did create your Azure subscription with a LiveID, you can still add a user to the default Azure Active Directory of the subscription and assign it admin permissions, so it can be used for unattended authentication). 
 ```
 Add-AzureAccount -Credential $cred
 ```
So if we are able to store the credentail somewhere safe and create the credential object on-the-fly we can still have unattended authentication working. 

I'm using the following function to store my password in an encrypted file. The [ConvertFrom-SecureString](https://technet.microsoft.com/en-us/library/hh849814.aspx) encrypts the string using the Windows Data Protection API, but you can also specify a certificate if you want to use that instead.
```
  function Save-PasswordToFile
    {
        Param
        (
            [parameter(Mandatory = $true)]
            [String]
            $FilePath,
            
            [parameter(Mandatory = $true)]
            [Switch]
            $PassThru
        )
        
        $secure = Read-Host -AsSecureString "Enter your Azure organization ID password."
        $encrypted = ConvertFrom-SecureString -SecureString $secure
        $result = Set-Content -Path $FilePath -Value $encrypted -PassThru
        
        if (!$result)
        {
            throw "Failed to store encrypted string at $FilePath."
        }
        if ($PassThru)
        {
            dir $FilePath
        }
    }
``` 
It can be use like this 
``` 
Save-PasswordToFile -FilePath azurecred.pass -PassThru 
```
When you want to retrive the password from the azurecred.pass and use it to create a credential object you can pass to Add-AzureAccount use the following commands.  
```
$securePassword = ConvertTo-SecureString (Get-Content -Path azurecred.pass)
$cred = New-Object System.Management.Automation.PSCredential(<username>, $securePassword)
Add-AzureAccount -Credential $cred
```
Now you PowerShell Context is authenticated.

###Setup a PowerShell Profile, for easy Authentication
If you work a lot with Azure PowerShell, it can be tedious, to login in every session. To ease the process you can create a profile that contains the above mentions scripts. 

To create a powershell profile use the following command. 
```
Test-Path $profile
#if Test-Path returns false you don't have a profile setup so run the next line, otherwise skip it
New-item –type file –force $profile
notepad $profile
```
In my profile I have added the following (replace the paths with your local paths), the [DG.Azure](../src/DG.Azure) module only contains what I have already explained.  
```
[Console]::CursorSize = 25 ##Fixes issues where the cursur is not visible in powershell

Import-Module c:\users\skp\documents\azure\DG.Azure

Function Login-Azure()
{
	Add-AzureAccountFromPasswordFile "youremail@yourdomain.com" -FilePath 'c:\users\skp\documents\azure\azurecreds.pass'
}
```
Now I can simply type 
```
Login-Azure
```
And my session will be authenticated.  You can of course also do this automatically, but I have chosen to do it manually is I don't always use the same subscription. 