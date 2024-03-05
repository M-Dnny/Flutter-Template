
$adbDevices = adb devices | Select-Object -Skip 1 | ForEach-Object { $_.Split("`t")[0] }

foreach ($device in $adbDevices) {
    echo "connecting $device now"
    adb connect $device 
}

$adbDevices = @(
"192.168.0.154"
# "192.168.0.106"
# "192.168.29.138",
# "192.168.29.195",
# "192.168.29.235"
);

foreach ($device in $adbDevices) {
    echo "connecting $device now"
    adb connect $device 
}   