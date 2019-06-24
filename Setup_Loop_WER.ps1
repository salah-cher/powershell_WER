#Get computers from text file. 1 compute per line
$myComputerList = Get-Content D:\Installs\computerList2.txt
$results = @()

#Loop Through Array
ForEach ($computer in $myComputerList) {

    #Execute a command on the computer
    $results += Invoke-Command -ComputerName $computer -ScriptBlock {
            #This is the command to execute
                   
             $path = 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps'
                    
                  try { 
                    
                     #check if LocalDumps exists if not create this path 
                      $path = 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps'
                        #if(!(Test-Path -Path $path))
                            #{ 
                            
                            New-Item -Path $path -ErrorAction Stop 

                            #The New-ItemProperty cmdlet creates a new property for an item and sets its value

         New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" -Name "DumpFolder" -Value "D:\CrashDumps" -PropertyType "ExpandString" -ErrorAction Stop

         New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" -Name "DumpCount" -Value 10 -PropertyType DWord -ErrorAction Stop

         New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\LocalDumps" -Name "DumpType" -Value 1 -PropertyType DWord -ErrorAction Stop
         return $env:COMPUTERNAME
                             #}
                              }

                    catch                     {

                          write-host "Caught an exception:" -ForegroundColor Red
                          write-host "Exception Type: $($_.Exception.GetType().FullName)" -ForegroundColor Red
                          write-host "Exception Message: $($_.Exception.Message)" -ForegroundColor Red

                          Write-Host "This computer $env:COMPUTERNAME is already configured : " -ForegroundColor Green
                   }
                                                                          

                  }
           }
  #foreach ($element in $results) {
  #$element
#}
#Write-Host "List of computer with WER configuration is : " $results