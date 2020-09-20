#!/bin/bash

sudo pacman -Syu
sudo pacman -S wget --noconfirm
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm
yay -S hunspell-ru xorg-xkill ttf-symbola ttf-clear-sans yay -S x-arc-shadow papirus-maia-icon-theme-git breeze-default-cursor-theme x-arc-shadow papirus-maia-icon-theme-git breeze-default-cursor-theme google-chrome --noconfirm
sleep 10
sudo pacman -S exfat-utils ntfs-3g capitaine-cursors --noconfirm
sleep 10
echo ' Ставим рограммы для работы с архивами'
sleep 10
sudo pacman -S file-roller p7zip unace lrzip unzip unrar lha ark --noconfirm
sleep 10
echo ' Ставим подключение Android к ПК через USB? '
sleep 10
sudo pacman -S gvfs-mtp --noconfirm
sleep 10
echo ' htop--диспетчер задач для linux  '
sleep 10
sudo pacman -S htop xterm --noconfirm
sleep 10
echo ' gwenview - программа для просмотра изображений и PDF, калькулятор'
sleep 10
sudo pacman -S gwenview okular kcalc --noconfirm
sleep 10
echo ' Ставим Steam   '
sudo pacman -S steam --noconfirm
sleep 10
echo 'Ставим neofetch screenfetch'
sleep 10
sudo pacman -S screenfetch neofetch --noconfirm
sleep 10
echo 'Ставим VLC'
sleep 10
sudo pacman -S vlc --noconfirm
sleep 10
echo 'Ставим gparted - программу для работы с разделами sdd/hdd'
sleep 10
sudo pacman -S gparted --noconfirm
sleep 10
echo 'Ставим telegram - мессенджер'
sleep 10
sudo pacman -S telegram-desktop oxygen-icons --noconfirm
sleep 10
echo 'Ставим программы для создания скриншотов'
sleep 10
sudo pacman -S spectacle flameshot --noconfirm
sleep 10
 echo 'Ставим лого ArchLinux в меню'
  wget git.io/arch_logo.png
  sudo mv -f ~/arch_logo.png /usr/share/pixmaps/arch_logo.png
yay -S woeusb alsi inxi --noconfirm
 echo 'Ставим reflector'
sleep 10
sudo pacman -S reflector --noconfirm

sleep 10
echo 'Ставим zsh'

sudo pacman -S zsh --noconfirm

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


exit
