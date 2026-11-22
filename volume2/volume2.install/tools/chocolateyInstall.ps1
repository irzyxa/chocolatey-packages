$packageName = 'volume2.install' 
$installerType = 'EXE'
$url = 'https://github.com/irzyxa/Volume2/releases/download/26.2.0.476/Setup_Volume2_26_2_0_476_x64.zip'
$checkSum = 'bd71a79e3c01b3988124783e31116f80a6271274e7f81f411ddf8b43d67ba2f9'
$silentArgs = '/silent RunProgramSettings_off'
$validExitCodes = @(0,1)
$tepmZip = Join-Path $env:TEMP "Setup_Volume2_26_2_0_476_x64.zip"
$tempExe = Join-Path $env:TEMP "Setup_Volume2_26_2_0_476_x64.exe"

try {
  Get-ChocolateyWebFile "$packageName" $tepmZip "$url" -ChecksumType "sha256" -Checksum $checkSum
  Get-ChocolateyUnzip $tepmZip $env:TEMP
  Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" $tempExe -validExitCodes $validExitCodes
} catch {
  throw
}
