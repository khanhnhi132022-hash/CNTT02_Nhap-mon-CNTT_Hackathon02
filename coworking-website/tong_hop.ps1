# Scripts : auto_report.ps1
# Tac gia : Khanh Nhi
# Ngay tao : 11/11

Write-Host "Dang loc log..."

"=== BAO CAO SU CO WEBSITE ===" > logs/tong_hop.txt
Get-content logs/member.log | select-string "status=404" >> logs/tong_hop.txt
(Get-content logs/member.log | select-string "status=500" | Measure-object).Count >> logs/tong_hop.txt

Write-Host "Hoan Thanh!"
