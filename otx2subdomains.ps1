Write-Host "otx2subdomains" -ForegroundColor Red
Write-Host "Scan Alienvault OTX and enumerate known subdomains for a target domain" -ForegroundColor Red
Write-Host " "
Write-Host "Created by Gabriel H." -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
Write-Host " "
Write-Host "Continue?" -InformationAction Inquire  -ForegroundColor Red
$targetDomain = Read-Host "Enter the target domain"
$pwd = Get-Location
Write-Host " "
New-Item -ItemType Directory -Path $pwd\otx2subdomains -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $pwd\otx2subdomains\$targetDomain -ErrorAction SilentlyContinue
New-Item -ItemType File -Path $pwd\otx2subdomains\$targetDomain\otx-subdomains-$targetDomain.txt -ErrorAction SilentlyContinue
New-Item -ItemType File -Path $pwd\otx2subdomains\$targetDomain\otx-subdomains-resolutions-$targetDomain.txt -ErrorAction SilentlyContinue
New-Item -ItemType File -Path $pwd\otx2subdomains\$targetDomain\otx-subdomains-ipv4-list-$targetDomain.txt -ErrorAction SilentlyContinue
Invoke-RestMethod -Method Get -Uri https://otx.alienvault.com/api/v1/indicators/domain/$targetDomain/passive_dns | Select-Object -ExpandProperty passive_dns | Format-Table hostname -HideTableHeaders -Wrap -AutoSize | grep -o -P  ".*$targetDomain" | Sort-Object -Unique | Out-File $pwd\otx2subdomains\$targetDomain\otx-subdomains-$targetDomain.txt utf8 -Force
Get-Content $pwd\otx2subdomains\$targetDomain\otx-subdomains-$targetDomain.txt | awk '{ print }{++cnt} END { print cnt }'
$subdomains = Get-Content $pwd\otx2subdomains\$targetDomain\otx-subdomains-$targetDomain.txt | Out-String -Stream
foreach ($subdomain in $subdomains){Invoke-RestMethod  -ErrorAction Ignore -Method Get https://dns.google/resolve?name=$subdomain | Select-Object -ExpandProperty Answer -ErrorAction Ignore | Format-Table -Wrap -AutoSize -Property "name","data" -HideTableHeaders | Tee-Object -FilePath $pwd\otx2subdomains\$targetDomain\otx-subdomains-resolutions-$targetDomain.txt -Append }
Write-Host " "
Get-Content -Encoding UTF8 $pwd\otx2subdomains\$targetDomain\otx-subdomains-resolutions-$targetDomain.txt | awk -F ' ' '{ print $2 }' | grep -o -P '^[0-9]*.*[0-9][.]*.*[0-9][.]*.*[0-9]$' | Sort-Object -Unique | Out-File $pwd\otx2subdomains\$targetDomain\otx-subdomains-ipv4-list-$targetDomain.txt utf8
Write-Host " "
Write-Host "Resolved IPv4s for $targetDomain" -ForegroundColor Red
Write-Host " "
Get-Content $pwd\otx2subdomains\$targetDomain\otx-subdomains-ipv4-list-$targetDomain.txt | awk '{ print }{++cnt} END { print cnt }'
Write-Host " "
Write-Host "Completed!" -ForegroundColor Red
Write-Host " "
Write-Host "Results saved to the following locations:" -ForegroundColor Red
Write-Host " "
Write-Host "$pwd\otx2subdomains\$targetDomain\otx-subdomains-$targetDomain.txt" -ForegroundColor Red
Write-Host "$pwd\otx2subdomains\$targetDomain\otx-subdomains-resolutions-$targetDomain.txt" -ForegroundColor Red
Write-Host "$pwd\otx2subdomains\$targetDomain\otx-subdomains-ipv4-list-$targetDomain.txt" -ForegroundColor Red 
Write-Host " "
Write-Host "otx2subdomains" -ForegroundColor Red
Write-Host " "
Write-Host "Created by Gabriel H." -ForegroundColor Red
Write-Host "https://github.com/ndr-repo | http://weekndr.me" -ForegroundColor Red
Write-Host " "
