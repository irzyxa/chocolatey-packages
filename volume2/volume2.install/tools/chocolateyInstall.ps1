$packageName = 'volume2.install' 
$installerType = 'EXE'
$url = 'https://github.com/irzyxa/Volume2/releases/download/v1.1.8/Setup_Volume2_1_1_8_465.zip'
$checkSum = '005fb379c5a3d746ef8a5f168abb6755ae89874b43642fcdd4839bc934c04aee'
$silentArgs = '/silent RunProgramSettings_off'
$validExitCodes = @(0,1)
$tepmZip = Join-Path $env:TEMP "Setup_Volume2_1_1_8_465.zip"
$tempExe = Join-Path $env:TEMP "Setup_Volume2_1_1_8_465.exe"

try {
  Get-ChocolateyWebFile "$packageName" $tepmZip "$url" -ChecksumType "sha256" -Checksum $checkSum
  Get-ChocolateyUnzip $tepmZip $env:TEMP
  Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" $tempExe -validExitCodes $validExitCodes
} catch {
  throw
}
