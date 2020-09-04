#!/bin/bash


loadkeys ru
setfont cyr-sun16
pacman -Sy

echo '2.3 Синхронизация системных часов'
timedatectl set-ntp true

sleep 10
echo "Добро пожаловать в установку ArchLinux"
sleep 10
echo 'Ваша разметка диска'
fdisk -l
sleep 10

cfdisk /dev/sdd

echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sdd1
mkfs.ext4  /dev/sdd2
mkfs.ext4  /dev/sdd3
sleep 10
echo '2.4.3 Монтирование дисков'
sleep 10
mount /dev/sdd2 /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount /dev/sdd1 /mnt/boot/efi
mount /dev/sdd3 /mnt/home

sleep 10

echo '3.1 Выбор зеркал для загрузки.'
sleep 10
rm -rf /etc/pacman.d/mirrorlist
wget https://git.io/mirrorlist
mv -f ~/mirrorlist /etc/pacman.d/mirrorlist
sleep 10
echo '3.2 Установка основных пакетов'
sleep 10
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl wget
sleep 10
echo '3.3 Настройка системы'
sleep 10
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL https://raw.githubusercontent.com/Fromus80/arch/master/arch2.sh)"
