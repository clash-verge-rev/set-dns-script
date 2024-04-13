nic=$(route -n get default | grep "interface" | awk '{print $2}')

hardware_port=$(networksetup -listallhardwareports | awk -v dev="$nic" '/Hardware Port/{port=$3} /Device:/{if ($2 == dev) {print port; exit}}')

original_dns=$(networksetup -getdnsservers $hardware_port)

# 将当前的dns设置保存到一个单独的文件中
echo $original_dns > original_dns.txt

networksetup -setdnsservers $hardware_port 223.5.5.5
