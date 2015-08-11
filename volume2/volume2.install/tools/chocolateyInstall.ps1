$packageName = 'volume2.install' 
$installerType = 'EXE'
$url = 'http://volumesqr.at.ua/Release/Setup_Volume2_1_1_4_347.zip'
$silentArgs = '/silent RunProgramSettings_off'
$validExitCodes = @(0,1)
$tepmZip = Join-Path $env:TEMP "Setup_Volume2_1_1_4_347.zip"
$tempExe = Join-Path $env:TEMP "Setup_Volume2_1_1_4_347.exe"

try {
  Get-ChocolateyWebFile "$packageName" $tepmZip "$url"
  Get-ChocolateyUnzip $tepmZip $env:TEMP
  Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" $tempExe -validExitCodes $validExitCodes

  # the following is all part of error handling
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
