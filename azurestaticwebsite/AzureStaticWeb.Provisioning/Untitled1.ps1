
$body = @{
    "grant_type" = "client_credentials"
    "client_secret" = "JuHA2fR3zkJtSP+ayJAyqvT6AHXTiCY/eyqPKSIOFiI="
    "client_id" = "06bf77e4-8b1f-4542-9e07-93173a8359e1"
    "resource" = "https://storage.azure.com/"
}

$response = Invoke-RestMethod -Method Post -Uri https://login.microsoftonline.com/harioverherehotmail.onmicrosoft.com/oauth2/token -Headers @{ "Content-Type" = "application/x-www-form-urlencoded" } -Body $body -Verbose

[XML]$xml = '<?xml version="1.0" encoding="utf-8"?><StorageServiceProperties><StaticWebsite><Enabled>true</Enabled><IndexDocument>index.html</IndexDocument><ErrorDocument404Path>404.html</ErrorDocument404Path></StaticWebsite></StorageServiceProperties>'

$headers = @{
    "Content-Type" = "application/xml"
    "x-ms-version" = "2018-03-28"
    "Authorization" = "Bearer $($response.access_token)"
}
$response

$headers

Invoke-RestMethod -Uri https://staticwebsiteeundevstor.blob.core.windows.net/?restype=service"&"comp=properties -Method Put -Body $xml -Headers $headers -Verbose