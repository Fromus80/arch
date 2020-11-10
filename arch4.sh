#!/bin/bash
yay -S conky-manager2 conky-cairo autojump --noconfirm
sudo pacman -S file-roller p7zip unace lrzip unzip unrar lha ark --noconfirm
yay -S crossover --noconfirm
wget git.io/conky.tar.gz
tar -xzf conky.tar.gz -C ~/

echo 'Ставим Видео драйвер'
timedatectl
timedatectl set-local-rtc 1 --adjust-system-clock
timedatectl

sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader nvidia --noconfirm


echo 'Ставим шрифты'

sudo pacman -S ttf-arphic-ukai git ttf-liberation ttf-dejavu ttf-arphic-uming ttf-fireflysung ttf-sazanami --noconfirm

echo 'Ставим звук'

sudo pacman -S alsa-utils pulseaudio-equalizer-ladspa pavucontrol paprefs plasma-pa kmix --noconfirm



sudo pacman -Syy

sudo pacman -S exfat-utils ntfs-3g --noconfirm
echo ' Ставим рограммы для работы с архивами'

echo ' Ставим подключение Android к ПК через USB? '

sudo pacman -S gvfs-mtp --noconfirm

echo ' htop--диспетчер задач для linux  '

sudo pacman -S htop --noconfirm

echo ' gwenview - программа для просмотра изображений и PDF, калькулятор'

sudo pacman -S gwenview okular kcalc --noconfirm

echo ' Ставим grub-customizer   '
sudo pacman -S grub-customizer --noconfirm

echo 'Ставим neofetch screenfetch'

sudo pacman -S screenfetch neofetch --noconfirm

echo 'Ставим VLC'

sudo pacman -S vlc --noconfirm

echo 'Ставим gparted - программу для работы с разделами sdd/hdd'

sudo pacman -S gparted --noconfirm

echo 'Ставим telegram - мессенджер'

sudo pacman -S telegram-desktop --noconfirm

echo 'Ставим программы для создания скриншотов'

sudo pacman -S flameshot --noconfirm
echo 'Ставим лого ArchLinux в меню'
wget git.io/arch_logo.png
sudo mv -f ~/arch_logo.png /usr/share/pixmaps/arch_logo.png
yay -S woeusb alsi inxi --noconfirm
echo 'Ставим reflector'
sudo pacman -S reflector --noconfirm
yay -S hunspell-ru --noconfirm
yay -S xorg-xkill --noconfirm
yay -S ttf-symbola ttf-weather-icons --noconfirm
yay -S ttf-clear-sans --noconfirm
#yay -S x-arc-shadow --noconfirm
#yay -S papirus-maia-icon-theme-git --noconfirm
#yay -S breeze-default-cursor-theme --noconfirm



exit
