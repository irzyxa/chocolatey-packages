$packageName = 'volume2.install' 
$installerType = 'EXE'
$url = 'https://github.com/irzyxa/Volume2/releases/download/v1.1.7/Setup_Volume2_1_1_7_449.zip'
$silentArgs = '/silent RunProgramSettings_off'
$validExitCodes = @(0,1)
$tepmZip = Join-Path $env:TEMP "Setup_Volume2_1_1_7_449.zip"
$tempExe = Join-Path $env:TEMP "Setup_Volume2_1_1_7_449.exe"

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
