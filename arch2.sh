#!/bin/bash
read -p "Введите имя компьютера: " hostname
read -p "Введите имя пользователя: " username

echo 'Прописываем имя компьютера'
echo $hostname > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

echo '3.4 Добавляем русскую локаль системы'
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 

echo 'Обновим текущую локаль системы'
locale-gen

echo 'Указываем язык системы'
echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf

echo 'Вписываем KEYMAP=ru FONT=cyr-sun16'
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

echo 'Создадим загрузочный RAM диск'
mkinitcpio -p linux

echo '3.5 Устанавливаем загрузчик'
pacman -Syy
pacman -S grub efibootmgr --noconfirm 
grub-install /dev/sdd

pacman -S os-prober mtools fuse --noconfirm
echo 'Обновляем grub.cfg'
grub-mkconfig -o /boot/grub/grub.cfg 

echo 'Добавляем пользователя'
useradd -m -g users -G wheel -s /bin/bash $username

echo 'Создаем root пароль'
passwd

echo 'Устанавливаем пароль пользователя'
passwd $username

echo 'Устанавливаем SUDO'
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo 'Раскомментируем репозиторий multilib Для работы 32-битных приложений в 64-битной системе.'
echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
sleep 10
pacman -Syy
sleep 10
pacman -Syu
sleep 10
echo "Куда устанавливем Arch Linux на виртуальную машину?"
read -p "1 - Да, 0 - Нет: " vm_setting
if [[ $vm_setting == 0 ]]; then
  gui_install="xorg-server xorg-drivers xorg-xinit amd-ucode"
elif [[ $vm_setting == 1 ]]; then
  gui_install="xorg-server xorg-drivers xorg-xinit virtualbox-guest-utils"
fi
sleep 10
echo 'Ставим иксы и драйвера'
pacman -S $gui_install
sleep 10
echo "Ставим PLASMA KDE"
pacman -S plasma 
sleep 10
echo 'Cтавим DM'
pacman -S sddm sddm-kcm --noconfirm
systemctl enable sddm
sleep 10
echo 'Ставим шрифты'
pacman -S ttf-arphic-ukai git ttf-liberation ttf-dejavu ttf-arphic-uming ttf-fireflysung ttf-sazanami--noconfirm
sleep 10
echo 'Ставим звук'
pacman -S alsa-utils pulseaudio-equalizer-ladspa   --noconfirm
sleep 10
echo 'Ставим Видео драйвер'
sleep 10
pacman -S nvidia  nvidia-utils  lib32-nvidia-utils --noconfirm
echo ' Ставим  поддержку ntfs и fat'
pacman -S exfat-utils ntfs-3g   --noconfirm
sleep 10
echo ' Ставим рограммы для работы с архивами'
pacman -S file-roller p7zip unace lrzip unzip unrar  lha ark --noconfirm
sleep 10
echo ' Ставим подключение Android к ПК через USB? '
pacman -S gvfs-mtp --noconfirm
sleep 10
echo ' htop--диспетчер задач для linux  '
pacman -S htop xterm --noconfirm
sleep 10
echo ' gwenview - программа для просмотра изображений'
pacman -S gwenview --noconfirm
sleep 10
echo ' Ставим Steam   '
pacman -S steam --noconfirm
sleep 10
echo 'Ставим neofetch screenfetch'
pacman -S screenfetch neofetch --noconfirm
sleep 10
echo 'Ставим VLC'
pacman -S vlc  --noconfirm
sleep 10
echo 'Ставим gparted - программу для работы с разделами sdd/hdd'
pacman -S gparted  --noconfirm
sleep 10
echo 'Ставим telegram - мессенджер'
pacman -S telegram-desktop   --noconfirm
sleep 10
echo 'Ставим программы для создания скриншотов'
pacman -S spectacle flameshot --noconfirm
sleep 10
echo 'Создаем директории'
pacman -S xdg-user-dirs --noconfirm
xdg-user-dirs-update
sleep 10
echo 'Ставим Conky'
pacman -S conky conky-manager reflector --noconfirm
sleep 10
echo 'Ставим сеть'
pacman -S networkmanager network-manager-applet ppp --noconfirm
sleep 10
echo 'Подключаем автозагрузку менеджера входа и интернет'
systemctl enable NetworkManager
sleep 10
echo 'Установка завершена! Перезагрузите систему.'
echo 'Если хотите подключить AUR, установить мои конфиги XFCE, тогда после перезагрзки и входа в систему, установите wget (sudo pacman -S wget) и выполните команду:'
echo 'wget git.io/archuefi3.sh && sh archuefi3.sh'
exit

