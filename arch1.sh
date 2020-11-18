#!/bin/bash

loadkeys ru
setfont cyr-sun16
echo '2.3 Синхронизация системных часов'

timedatectl set-ntp true


echo 'Ваша разметка диска'

fdisk -l
lsblk

echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sdd1
mkfs.ext4  /dev/sdd2
mkfs.ext4  /dev/sdd3

echo '2.4.3 Монтирование дисков'
mount /dev/sdd2 /mnt
mkdir /mnt/{home,boot}
mkdir -p /mnt/boot/efi
mount /dev/sdd1 /mnt/boot/efi
mount /dev/sdd3 /mnt/home

lsblk
echo '3.2 Установка основных пакетов'
sleep 10
pacstrap /mnt base base-devel linux-lts linux-firmware nano dhcpcd netctl

echo '3.3 Настройка системы'

genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL https://raw.githubusercontent.com/Fromus80/arch/master/arch2.sh)"
