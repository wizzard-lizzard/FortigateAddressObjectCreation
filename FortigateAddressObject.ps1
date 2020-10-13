param (
    [Parameter(Mandatory)]
    [string]$InFile,
    [Parameter(Mandatory)]
    [string]$OutFile, 
    [Parameter(Mandatory)]
    [string]$Prefix,
    [Parameter(Mandatory)]
    [string]$GroupName
)

$regex = [Regex]::new('(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})(/\d{2})')

echo "config firewall address" | Set-Content -Path $OutFile
echo $infile
foreach($address in [System.IO.File]::ReadLines($InFile)) {
        $ip_only = $address -replace $regex, '$1.$2.$3.$4'
        $address_command = "edit $Prefix-$ip_only"
        $GroupSetCommand = $GroupSetCommand + "`"$address`" "
        echo $address_command | Add-Content -Path $OutFile
        echo "set subnet $address" | Add-Content -Path $OutFile
        echo "next" | Add-Content -Path $OutFile
    }
echo "end" | Add-Content -Path $OutFile


echo "" | Add-Content -Path $OutFile
echo "config firewall addrgrp" | Add-Content -Path $OutFile
echo "edit $GroupName" | Add-Content -Path $OutFile
echo $GroupSetCommand | Add-Content -Path $OutFile
echo "next" | Add-Content -Path $OutFile
echo "end" | Add-Content -Path $OutFile