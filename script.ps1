$username = $env:UserName;
$text = 'Hello World!' | Out-File $text -FilePath C:\Users\$username\Desktop\hello.txt