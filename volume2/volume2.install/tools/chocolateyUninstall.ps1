$packageName = "volume2.install"
$installerType = 'EXE'
$silentArgs = '/SILENT'
$appDir = 'C:\Program Files (x86)\Volume2\uninstall.exe'
$validExitCodes = @(0,1)

try {
  Uninstall-ChocolateyPackage $packageName "$installerType" "$silentArgs" "$appDir" -validExitCodes $validExitCodes
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}