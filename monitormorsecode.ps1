$primaryMonitorPath = Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams | Select -ExpandProperty "InstanceName"
$primaryMonitorName = (Split-Path -Path $primaryMonitorPath).split("\")[1]

$dashLength = 20

$on = 1
$len = 0
while($on -eq 1) {
    $writing = -Not (Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorBasicDisplayParams | Where-Object InstanceName -Match $primaryMonitorName).Active
    if ($writing) {
        $len += 1
    }
    else {
        if ($len -ge $dashLength) {
            Write-Host -
        }
        elseif ($len -gt 0) {
            Write-Host .
            }
        $len = 0
    }
}