#!/bin/bash

sudo pacman -Syu

sudo pacman -S exfat-utils ntfs-3g capitaine-cursors --noconfirm
echo ' Ставим рограммы для работы с архивами'

sudo pacman -S file-roller p7zip unace lrzip unzip unrar lha ark --noconfirm

echo ' Ставим подключение Android к ПК через USB? '

sudo pacman -S gvfs-mtp --noconfirm

echo ' htop--диспетчер задач для linux  '

sudo pacman -S htop --noconfirm

echo ' gwenview - программа для просмотра изображений и PDF, калькулятор'

sudo pacman -S gwenview okular kcalc --noconfirm

echo ' Ставим Steam   '
sudo pacman -S steam grub-customizer --noconfirm

echo 'Ставим neofetch screenfetch'

sudo pacman -S screenfetch neofetch --noconfirm

echo 'Ставим VLC'

sudo pacman -S vlc --noconfirm

echo 'Ставим gparted - программу для работы с разделами sdd/hdd'

sudo pacman -S gparted --noconfirm

echo 'Ставим telegram - мессенджер'

sudo pacman -S telegram-desktop oxygen-icons --noconfirm

echo 'Ставим программы для создания скриншотов'

sudo pacman -S spectacle flameshot --noconfirm
echo 'Ставим лого ArchLinux в меню'
wget git.io/arch_logo.png
sudo mv -f ~/arch_logo.png /usr/share/pixmaps/arch_logo.png
yay -S woeusb alsi inxi --noconfirm
echo 'Ставим reflector'
sudo pacman -S reflector --noconfirm
yay -S hunspell-ru --noconfirm
yay -S xorg-xkill --noconfirm
yay -S ttf-symbola --noconfirm
yay -S ttf-clear-sans --noconfirm
yay -S x-arc-shadow --noconfirm
yay -S papirus-maia-icon-theme-git --noconfirm
yay -S breeze-default-cursor-theme --noconfirm
yay -S conky-manager2-git --noconfirm

exit
