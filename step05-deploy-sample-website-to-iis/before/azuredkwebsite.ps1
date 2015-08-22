Configuration azuredkwebsite
{
  param (
    $MachineName,
    $WebDeployPackagePath,
    $UserName,
    $Password
    )

  Node $MachineName
  {
    #Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = "Present"
      Name = "Web-Server"
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure = "Present"
      Name = "Web-Asp-Net45"
    }
    #Install IIS Management Console 
    WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }
    
     #script block to download Web Platform Installer MSI from Microsoft
    Script DownloadWebPIImage
    {
        GetScript = {
            @{
                Result = "WebPIInstall"
            }
        }
        TestScript = {
            Test-Path "C:\WindowsAzure\wpilauncher.exe"
        }
        SetScript ={
            $source = "http://go.microsoft.com/fwlink/?LinkId=255386"
            $destination = "C:\WindowsAzure\wpilauncher.exe"
            Invoke-WebRequest $source -OutFile $destination
       
        }
    }
    
    #Installs the Web Platform Installer
    Package WebPi_Installation
        {
            Ensure = "Present"
            Name = "Microsoft Web Platform Installer 5.0"
            Path = "C:\WindowsAzure\wpilauncher.exe"
            ProductId = '4D84C195-86F0-4B34-8FDE-4A17EB41306A'
            Arguments = ''
        }

    #Use Web Platform Installer to install Web Deploy
    Package WebDeploy_Installation
        {
            Ensure = "Present"
            Name = "Microsoft Web Deploy 3.5"
            Path = "$env:ProgramFiles\Microsoft\Web Platform Installer\WebPiCmd-x64.exe"
            ProductId = ''
            #Arguments = "/install /products:ASPNET45,ASPNET_REGIIS_NET4,NETFramework452,NETFramework4Update402,NetFx4,NetFx4Extended-ASPNET45,NetFxExtensibility45,DefaultDocument,DirectoryBrowse,StaticContent,StaticContentCompression,WDeploy  /AcceptEula"
			      Arguments = "/install /products:WDeploy  /AcceptEula"
			      DependsOn = @("[Package]WebPi_Installation")
        }
	
    #Deploy the Web Package with Web Deploy to IIS
    Script DeployWebPackage
    {
      GetScript = {
              @{
                  Result = ""
              }
          }
          TestScript = {
              $false
          }
          SetScript ={
  
          $WebClient = New-Object -TypeName System.Net.WebClient
          $Destination= "C:\WindowsAzure\WebApplication.zip" 
          $WebClient.DownloadFile($using:WebDeployPackagePath,$destination)       
          $Argument = '-source:package="C:\WindowsAzure\WebApplication.zip"' + ' -dest:auto,ComputerName="localhost",'+"username=$using:UserName" +",password=$using:Password" + ' -verb:sync -allowUntrusted'
          $MSDeployPath = (Get-ChildItem "HKLM:\SOFTWARE\Microsoft\IIS Extensions\MSDeploy" | Select -Last 1).GetValue("InstallPath")
          Start-Process "$MSDeployPath\msdeploy.exe" $Argument -Verb runas
          
          }
  
    }
  }
} 