function Save-PasswordToFile
{
<#
  .Synopsis
    Saves a password to an encrypted file
   .Description
    The Save-PasswordToFile function takes a user input and stores in encryped in the specified file.
   .Example
    Save-PasswordToFile -FilePath creds.pass
    Saves the password entered by the user to creds.pass
   .Parameter FilePath
    The path to the password file.
   .Parameter PassThru
    Returns an object representing the content. By default, this cmdlet does not generate any output. 
 #>
    Param
    (
        [parameter(Mandatory = $true)]
        [String]
        $FilePath,
        
        [parameter(Mandatory = $false)]
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


function Add-AzureAccountFromPasswordFile
{
<#
  .Synopsis
    Signs in to Azure with username and the password file provided.
   .Description
    The Add-AzureAccountFromPasswordFile function takes a username and a filepath to a password file and authenticates with Azure.
   .Example
    Add-AzureAccountFromPasswordFile -UserName account@domain.com -FilePath creds.pass
    Authenticate with account@domain.com
   .Parameter FilePath
    The path to the password file.
   .Parameter UserName
    The username to authenticate with.
 #>
    Param(
    [parameter(Mandatory = $true)]
                [String]
    $UserName, 
    [parameter(Mandatory = $true)]
    [String]
    $FilePath)
    if ((get-module azure) -eq $null)
    {
        Import-Module Azure
    }

    $securePassword = ConvertTo-SecureString (Get-Content -Path $FilePath)
    $cred = New-Object System.Management.Automation.PSCredential($UserName, $securePassword)
    $result = Add-AzureAccount -Credential $cred
}
