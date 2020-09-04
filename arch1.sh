#!/bin/bash


loadkeys ru
setfont cyr-sun16

echo '2.3 Синхронизация системных часов'
timedatectl set-ntp true

sleep 10

echo 'Ваша разметка диска'
fdisk -l
sleep 10

cfdisk /dev/sde

echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sde1
mkfs.ext4  /dev/sde2
mkfs.ext4  /dev/sde3

echo '2.4.3 Монтирование дисков'
mount /dev/sde2 /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount /dev/sde1 /mnt/boot/efi
mount /dev/sde3 /mnt/home

sleep 10

echo '3.1 Выбор зеркал для загрузки.'
nano /etc/pacman.d/mirrorlist
sleep 10
echo '3.2 Установка основных пакетов'
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl

echo '3.3 Настройка системы'
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL git.io/archuefi2.sh)"
