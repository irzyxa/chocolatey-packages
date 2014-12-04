$packageName = 'volume2.install' 
$installerType = 'EXE'
$url = 'http://volumesqr.at.ua/Release/Setup_Volume2_1_1_3_247.zip'
$silentArgs = '/SILENT'
$validExitCodes = @(0,1)
$tepmZip = Join-Path $env:TEMP "Setup_Volume2_1_1_3_247.zip"
$tempExe = Join-Path $env:TEMP "Setup_Volume2_1_1_3_247.exe"

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
