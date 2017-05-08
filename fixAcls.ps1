$path = "C:\inetpub\wwwroot\LegacyApp"
$acl = Get-Acl $path
Set-Acl $path $acl
