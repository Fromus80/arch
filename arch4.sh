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

sudo pacman -S nvidia nvidia-settings opencl-nvidia lib32-opencl-nvidia lib32-nvidia-utils --noconfirm


echo 'Ставим шрифты'

sudo pacman -S ttf-arphic-ukai git ttf-liberation ttf-dejavu ttf-arphic-uming ttf-fireflysung ttf-sazanami --noconfirm

echo 'Ставим звук'

sudo pacman -S alsa-utils pulseaudio-equalizer-ladspa pavucontrol paprefs plasma-pa kmix --noconfirm



sudo pacman -Syy

sudo pacman -S exfat-utils ntfs-3g --noconfirm
echo ' Ставим рограммы для работы с архивами'
echo ' gwenview - программа для просмотра изображений и PDF, калькулятор'

sudo pacman -S gwenview okular kcalc baobab --noconfirm

echo ' Ставим grub-customizer   '
sudo pacman -S grub-customizer qbittorrent --noconfirm

echo 'Ставим neofetch screenfetch'

sudo pacman -S screenfetch neofetch --noconfirm

echo 'Ставим VLC'

sudo pacman -S vlc --noconfirm

echo 'Ставим telegram - мессенджер'

sudo pacman -S telegram-desktop --noconfirm

echo 'Ставим программы для создания скриншотов'

sudo pacman -S flameshot --noconfirm
echo 'Ставим лого ArchLinux в меню'
wget git.io/arch_logo.png
sudo mv -f ~/arch_logo.png /usr/share/pixmaps/arch_logo.png

yay -S woeusb alsi inxi hunspell-ru xorg-xkill ttf-symbola ttf-weather-icons ttf-clear-sans pamac-aur --noconfirm


echo ' Ставим подключение Android к ПК через USB? '

sudo pacman -S gvfs-mtp --noconfirm

echo ' htop--диспетчер задач для linux  '

sudo pacman -S htop --noconfirm

echo 'Ставим gparted - программу для работы с разделами sdd/hdd'

sudo pacman -S gparted --noconfirm


echo 'Ставим reflector'
sudo pacman -S reflector --noconfirm

exit
