#Get Credentials to connect
$Credential = Get-Credential
  
#Connect to Exchange Online
Connect-ExchangeOnline -Credential $Credential -ShowBanner:$False
 
#PowerShell to Import Members to office 365 group from CSV
Import-CSV "C:\Temp\GroupMembers.csv" | ForEach-Object {
    Add-UnifiedGroupLinks -Identity $_.GroupID -LinkType Members -Links $_.Member
    Write-host -f Green "Added Member '$($_.Member)' to Office 365 Group '$($_.GroupID)'"
}
 
#Disconnect Exchange Online
Disconnect-ExchangeOnline -Confirm:$False