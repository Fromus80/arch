#!/bin/bash
loadkeys ru
setfont cyr-sun16
echo '2.3 Синхронизация системных часов'

timedatectl set-ntp true


echo 'Ваша разметка диска'
cfdisk /dev/sdb
fdisk -l
lsblk

echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sdb1
mkswap /dev/sdb2
mkfs.ext4  /dev/sdb3
mkfs.ext4  /dev/sdb4

echo '2.4.3 Монтирование дисков'
mount /dev/sdb3 /mnt
mkdir /mnt/{home,boot}
mkdir -p /mnt/boot/efi
mount /dev/sdb1 /mnt/boot/efi
swapon /dev/sdb2
mount /dev/sdb4 /mnt/home

lsblk
echo '3.2 Установка основных пакетов'
sleep 10
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl wget amd-ucode 

echo '3.3 Настройка системы'

genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL https://raw.githubusercontent.com/Fromus80/arch/master/arch2.sh)"
