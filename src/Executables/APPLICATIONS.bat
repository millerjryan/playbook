echo Installing Revision Tool...
Powershell -NonInteractive -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "& {Invoke-WebRequest ((Invoke-RestMethod -Uri \"https://api.github.com/repos/meetrevision/revision-tool/releases/latest\" -Method Get | ConvertTo-Json | ConvertFrom-Json).assets | where-object { $_.name -eq \"RevisionTool-Setup.exe\" }).browser_download_url -OutFile \"$env:TEMP\RevisionTool-Setup.exe\"}"
call "%temp%\RevisionTool-Setup.exe" /VERYSILENT /TASKS="desktopicon"
del "%temp%\RevisionTool-Setup.exe"

echo Installing Brave Browser...
mkdir "%PROGRAMFILES%\BraveSoftware\Brave-Browser\Application"
copy /y "BraveSoftware\Brave-Browser\Application\master_preferences" "%PROGRAMFILES%\BraveSoftware\Brave-Browser\Application\master_preferences"
copy /y "BraveSoftware\bookmarks.html" "%PROGRAMFILES%\BraveSoftware\bookmarks.html"
Powershell -NonInteractive -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest ((Invoke-RestMethod -Uri \"https://api.github.com/repos/brave/brave-browser/releases/latest\" -Method Get | ConvertTo-Json | ConvertFrom-Json).assets | where-object { $_.name -eq \"BraveBrowserStandaloneSetup.exe\" }).browser_download_url -OutFile \"$env:TEMP\BraveBrowserStandaloneSetup.exe\" "
call "%temp%\BraveBrowserStandaloneSetup.exe" /silent /install
del "%temp%\BraveBrowserStandaloneSetup.exe"
:: Fixes the Internet Explorer error which says "Unable to launch Microsoft Edge"
reg add "HKCR\MSEdgeHTM" /ve /t REG_SZ /d "Brave HTML Document" /f
reg add "HKCR\MSEdgeHTM" /v "AppUserModelId" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgeHTM\Application" /v "AppUserModelId" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgeHTM\Application" /v "ApplicationIcon" /t REG_SZ /d "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe,0" /f
reg add "HKCR\MSEdgeHTM\Application" /v "ApplicationName" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgeHTM\Application" /v "ApplicationDescription" /t REG_SZ /d "Access the Internet" /f
reg add "HKCR\MSEdgeHTM\Application" /v "ApplicationCompany" /t REG_SZ /d "Brave Software Inc" /f
reg add "HKCR\MSEdgeHTM\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe,0" /f
reg add "HKCR\MSEdgeHTM\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe\" --single-argument %%1" /f
reg add "HKCR\MSEdgeHTM\shell\runas\command" /ve /t REG_SZ /d "\"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe\" --do-not-de-elevate --single-argument %%1" /f
reg add "HKCR\MSEdgeMHT" /ve /t REG_SZ /d "Brave MHT Document" /f
reg add "HKCR\MSEdgeMHT" /v "AppUserModelId" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgeMHT\Application" /v "AppUserModelId" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgeMHT\Application" /v "ApplicationIcon" /t REG_SZ /d "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe,0" /f
reg add "HKCR\MSEdgeMHT\Application" /v "ApplicationName" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgeMHT\Application" /v "ApplicationDescription" /t REG_SZ /d "Access the Internet" /f
reg add "HKCR\MSEdgeMHT\Application" /v "ApplicationCompany" /t REG_SZ /d "Brave Software Inc" /f
reg add "HKCR\MSEdgeMHT\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe,0" /f
reg add "HKCR\MSEdgeMHT\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe\" --single-argument %%1" /f
reg add "HKCR\MSEdgeMHT\shell\runas\command" /ve /t REG_SZ /d "\"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe\" --do-not-de-elevate --single-argument %%1" /f
reg add "HKCR\MSEdgePDF" /ve /t REG_SZ /d "Brave PDF Document" /f
reg add "HKCR\MSEdgePDF" /v "AppUserModelId" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgePDF\Application" /v "AppUserModelId" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgePDF\Application" /v "ApplicationIcon" /t REG_SZ /d "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe,0" /f
reg add "HKCR\MSEdgePDF\Application" /v "ApplicationName" /t REG_SZ /d "Brave" /f
reg add "HKCR\MSEdgePDF\Application" /v "ApplicationDescription" /t REG_SZ /d "Access the Internet" /f
reg add "HKCR\MSEdgePDF\Application" /v "ApplicationCompany" /t REG_SZ /d "Brave Software Inc" /f
reg add "HKCR\MSEdgePDF\DefaultIcon" /ve /t REG_SZ /d "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe,0" /f
reg add "HKCR\MSEdgePDF\shell\open\command" /ve /t REG_SZ /d "\"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe\" --single-argument %%1" /f
reg add "HKCR\MSEdgePDF\shell\runas\command" /ve /t REG_SZ /d "\"C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe\" --do-not-de-elevate --single-argument %%1" /f

echo Installing Custom Software...
:: Utils
winget install Microsoft.PowerToys
winget install Nilesoft.Shell
winget install Rainmeter.Rainmeter
winget install ShareX.ShareX
winget install Stardock.Start11
winget install VB-Audio.Voicemeeter.Potato
winget install Nvidia.GeForceExperience
winget install VideoLAN.VLC
winget install WinSCP.WinSCP
winget install Logitech.GHUB
winget install Microsoft.VisualStudioCode
winget install Famatech.AdvancedIPScan
winget install AutoHotkey.AutoHotkey
winget install Bitwarden.Bitwarden
winget install Guru3D.Afterburner
:: Chat
winget install Discord.Discord
:: RoundedTB
winget install 9MTFTXSJ9M7F
:: Launchers
winget install Valve.Steam
winget install EpicGames.EpicGamesLauncher
winget install ElectronicArts.EADesktop
winget install PrismLauncher.PrismLauncher
:: Xbox
winget install 9MV0B5HZVK9Z
:: Xbox Insider Hub
winget install 9PLDPG46G47Z 
:: Office365
winget install 9WZDNCRD29V9
