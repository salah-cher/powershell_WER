#Get computers from text file. 1 compute per line
$myComputerList = Get-Content D:\Installs\computerList.txt
$results = @()

#Loop Through Array
ForEach ($computer in $myComputerList) {

    #Execute a command on the computer
    $results += Invoke-Command -ComputerName $computer -ScriptBlock {
            #This is the command to execute
                   
             $path = 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps'
                    
                  try { 
                    
                     Get-Item -Path $path -ErrorAction Stop | Out-Null
                     }

                    catch [System.Management.Automation.SessionStateException]
                    {
                          Write-Host "For this host" $env:COMPUTERNAME "there is no WER config" 
                          return $env:COMPUTERNAME
                   }



                  }
           }
Write-Host "List of computer without WER configuration is : " $results
