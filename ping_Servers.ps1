$Ffile = ".\Downloads\listServers.txt"
$Dfile = ".\Downloads\listUpServers.txt"
#empty destination files
Clear-Content $Dfile

#loop on source file
Get-Content $Ffile | ForEach-Object {

$line = $_
#Write-Host "the host is " $line 
if (Test-Connection -ComputerName $line -Count 2 -Quiet ) {
Write-Host "computer $line is up " -ForegroundColor Green
Add-Content $Dfile -Value $line 
         } 
 
else {Write-Host "computer $line is down "   -ForegroundColor Red}
  

}
