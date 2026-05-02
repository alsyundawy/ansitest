<# win11 / server takeover script for ansible
2026.Apr kneutron

NOTE Get on target system via shared drive, scp or http
#> 

Write-host "Run as admin powershell"
Write-host "NOTE you may need to run beforehand:  Set-ExecutionPolicy -Policytype RemoteSigned "
Write-host ""
Write-host '+ also need to " choco install python "'
Write-host ""
Write-host "If get this error:"
Write-host ">WinRM firewall exception will not work since one of the network
connection types on this machine is set to Public. Change the network connection 
type to either Domain or Private and try again."
Write-host ""
Write-host "Fix: Enter Settings, Network & Internet, Ethernet  and set network profile type to Private"
Write-host "Note that doing this may drop your remote desktop connection!"

# Enable Remoting: 
Enable-PSRemoting -Force

# Enable Basic Auth: 
Set-Item WSMan:\localhost\Service\Auth\Basic -Value $true

# Allow Unencrypted Traffic (Lab/Test only): 
Set-Item WSMan:\localhost\Service\AllowUnencrypted -Value $true

# Configure Listener: 
cmd /c "winrm quickconfig" 	# (for HTTP) -- or configure HTTPS with certificates for production.

# Firewall: Ensure port 5985 (HTTP) or 5986 (HTTPS) is open
cmd /c 'netsh advfirewall firewall add rule name="Open SSH Port 22" dir=in action=allow protocol=TCP localport=22 remoteip=any'
cmd /c 'netsh advfirewall firewall add rule name="Open Port for ansible" dir=in action=allow protocol=TCP localport=5985 remoteip=any'

# install chocolatey package mgr
cmd /c "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

# install choco python
choco install -y python

cmd /c "pause"
