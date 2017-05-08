# Base the container from microsoft/windowsservercore
FROM microsoft/windowsservercore
# Enable IIS
RUN dism /online /enable-feature /all /featurename:iis-webserver /NoRestart
# Install ASP.net and it's dependencies
RUN dism /online /enable-feature /all /featurename:IIS-ASPNET45
# Install WebDeploy_2_10_amd64_en-US.msi
RUN mkdir c:\install
ADD WebDeploy_2_10_amd64_en-US.msi /install/WebDeploy_2_10_amd64_en-US.msi
WORKDIR /install
RUN powershell start-Process msiexec.exe -ArgumentList '/i c:\install\WebDeploy_2_10_amd64_en-US.msi /qn' -Wait

# Install the legacy application
RUN mkdir c:\webapplication
WORKDIR /webapplication
ADD fixAcls.ps1 /webapplication/fixAcls.ps1
ADD LegacyApp.zip  /webapplication/LegacyApp.zip
ADD LegacyApp.deploy.cmd /webapplication/LegacyApp.deploy.cmd
ADD LegacyApp.SetParameters.xml /webapplication/LegacyApp.SetParameters.xml
RUN LegacyApp.deploy.cmd, /Y

# Force windows to re-initialize the Access Controll List for the web app directory
RUN powershell.exe -executionpolicy bypass c:\webapplication\fixAcls.ps1
# Installing again
RUN LegacyApp.deploy.cmd, /Y

# Expose port 80
EXPOSE 80
