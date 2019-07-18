#script made by Salah.CHERKAOUI
#script will take current information about domain name from current computer
#script takes OU name as argument if not supplied then default is WebApps


$ou= "WebApps"
$Ffile = ".\Downloads\listServers.txt"
Clear-Content $Ffile

#$listOU = Get-ADOrganizationalUnit -Filter 'Name -like $ou' | Select-Object -ExpandProperty DistinguishedName | Out-File $Sfile

$listOU = Get-ADOrganizationalUnit -Filter 'Name -like $ou' | Select-Object -ExpandProperty DistinguishedName

#Write-Host "list of OU :" $listOU
#Write-Host "searching for computers under all previous OU"

foreach ($var in $listOU){
Get-ADComputer -Filter * -SearchBase $var | Select-Object -ExpandProperty Name | Out-File $Ffile -Append
}
