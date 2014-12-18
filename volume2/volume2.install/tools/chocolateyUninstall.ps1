$packageName = "volume2.install"
$installerType = 'EXE'
$silentArgs = '/SILENT'
$validExitCodes = @(0,1)

$is64bit = Get-ProcessorBits 64

if ($is64bit) {
  $appDir = "${Env:ProgramFiles(x86)}\Volume2\uninstall.exe"
} else {
  $appDir = "${Env:ProgramFiles}\Volume2\uninstall.exe"
}

try {
  Uninstall-ChocolateyPackage $packageName "$installerType" "$silentArgs" "$appDir" -validExitCodes $validExitCodes
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}