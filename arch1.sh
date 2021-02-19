#!/bin/bash
loadkeys ru
setfont cyr-sun16
echo '2.3 Синхронизация системных часов'

timedatectl set-ntp true


echo 'Ваша разметка диска'

fdisk -l
lsblk

echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sde1
mkfs.ext4  /dev/sde2
mkfs.ext4  /dev/sde3

echo '2.4.3 Монтирование дисков'
mount /dev/sde2 /mnt
mkdir /mnt/{home,boot}
mkdir -p /mnt/boot/efi
mount /dev/sde1 /mnt/boot/efi
mount /dev/sde3 /mnt/home

lsblk
echo '3.2 Установка основных пакетов'
sleep 10
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl wget amd-ucode 

echo '3.3 Настройка системы'

genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL https://raw.githubusercontent.com/Fromus80/arch/master/arch2.sh)"
