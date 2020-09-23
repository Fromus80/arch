#!/bin/bash

sudo pacman -Syu
sudo pacman -S wget --noconfirm
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm
sudo pacman -S capitaine-cursors --noconfirm
sudo pacman -S oxygen-icons --noconfirm
echo 'Ставим лого ArchLinux в меню'
wget git.io/arch_logo.png
sudo mv -f ~/arch_logo.png /usr/share/pixmaps/arch_logo.png
yay -S hunspell-ru --noconfirm
yay -S xorg-xkill --noconfirm
yay -S ttf-symbola --noconfirm
yay -S ttf-clear-sans --noconfirm
yay -S x-arc-shadow --noconfirm
yay -S papirus-maia-icon-theme-git --noconfirm
yay -S breeze-default-cursor-theme --noconfirm
yay -S x-arc-shadow --noconfirm
yay -S papirus-maia-icon-theme-git --noconfirm
yay -S breeze-default-cursor-theme --noconfirm
yay -S google-chrome --noconfirm
yay -S ttf-meslo-nerd-font-powerlevel10k --noconfirm
yay -S nerd-fonts-meslo --noconfirm
yay -S ttf-meslo --noconfirm

exit
