 $uri = "https://globalartifactstg.blob.core.windows.net/globalsoftwarelink4artifact/toadedge_1.2.0_x64_en.msi"
$out = "c:\toadedge_1.2.0_x64_en.msi"
Invoke-WebRequest -uri $uri -OutFile $out
Start-Process -FilePath "msiexec" -ArgumentList "/i $out /quiet /norestart /l c:\installlog.txt"   
Remove-Item -Path C:\toadedge_1.2.0_x64_en.exe

