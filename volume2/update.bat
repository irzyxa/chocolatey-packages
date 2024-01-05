choco apikey --key [key] --source https://push.chocolatey.org/
cd volume2
choco pack volume2.nuspec
choco push volume2.[version].nupkg --source https://push.chocolatey.org/
cd ..
cd volume2.install
choco pack volume2.install.nuspec
choco push volume2.install.[version].nupkg --source https://push.chocolatey.org/
cd ..
cd volume2.portable
choco pack volume2.portable.nuspec
choco push volume2.portable.[version].nupkg --source https://push.chocolatey.org/
