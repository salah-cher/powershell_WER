$keyValue = $path = 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps'

try {

#check item exists

if((Test-Path -Path $path))
        {

Write-Host " item key exists"

#remove item 
Remove-Item -Path $keyValue -Recurse -ErrorAction Stop
        }

}

catch {

Write-Host "item key does not exists"
}
