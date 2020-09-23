#!/bin/bash

sudo pacman -Syu
sudo pacman -S wget --noconfirm
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm

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
sudo pacman -S steam grub-customizer --noconfirm
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
yay -S hunspell-ru --noconfirm
yay -S xorg-xkill --noconfirm
yay -S ttf-symbola --noconfirm
yay -S ttf-clear-sans --noconfirm
yay -S x-arc-shadow --noconfirm
yay -S papirus-maia-icon-theme-git --noconfirm
yay -S breeze-default-cursor-theme --noconfirm
yay -S google-chrome --noconfirm
sleep 10
sleep 10
echo 'Ставим zsh'

sudo pacman -S zsh --noconfirm

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
yay -S ttf-meslo-nerd-font-powerlevel10k --noconfirm
yay -S nerd-fonts-meslo --noconfirm
yay -S ttf-meslo --noconfirm
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

exit
