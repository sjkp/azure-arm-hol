# Deploy Sample Website to IIS
In this step we will build upon the DSC module we used to install IIS in the last step. This time we will download files and install custom applications on the server. 
The application we are going to install are: 
- Web Platform Installer 
- Web Deploy 

With these on the server we can use web deploy to deploy a web site to the IIS Server.  

## Web Deploy 
When using web deploy, it is important that the site name in the deploy package matches the web site on the server. In the sample web application it is deployed to "Default Web Site".

## Deployment
[Deployment Guide](../docs/deployment.md)   