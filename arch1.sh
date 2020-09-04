#!/bin/bash

echo '3.2 Установка основных пакетов'
sleep 10
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl wget
sleep 10
echo '3.3 Настройка системы'
sleep 10
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL https://raw.githubusercontent.com/Fromus80/arch/master/arch2.sh)"
