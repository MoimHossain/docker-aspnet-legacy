# What is 'docker-aspnet-legacy'
This repository has a sample `Dockerfile` that allows packaging an application with ASP.net 4.5 version (yes, we might call it as legacy now) into a docker container.

# How
Let's assume the web application that we are trying package is named as `LegacyApp`. 

## Steps

- Compile the application and create a web deploy package from Visual Studio.
- Save the package in a directory (i.e. c:\temp\package)
- Download the `WebDeploy_2_10_amd64_en-US.msi` from [Microsoft Web site](https://www.google.nl/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwj8xPmcquDTAhWmdpoKHW6eBnwQFggpMAA&url=https%3A%2F%2Fwww.microsoft.com%2Fen-us%2Fdownload%2Fdetails.aspx%3Fid%3D25230&usg=AFQjCNFBdRSDQmtSg4UVtWl4i8bydefmbA&sig2=EwhaOHeCgbTrFnJLgbme5w).
- Create a `powershell` file (i.e. `fixAcls.ps1`) to fix the ACLs (Settings up Access Control List for the web application directory)
- Create the `dockerfile`
- Build the container
- Run the container

# Summary

By following the steps above, any ASP.net 4.5, 4.6.2 application can be composed as a docker container. 


