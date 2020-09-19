#!/bin/bash
sleep 10
sudo pacman -S exfat-utils ntfs-3g
sleep 10
echo ' Ставим рограммы для работы с архивами'
sleep 10
sudo pacman -S file-roller p7zip unace lrzip unzip unrar lha ark
sleep 10
echo ' Ставим подключение Android к ПК через USB? '
sleep 10
sudo pacman -S gvfs-mtp
sleep 10
echo ' htop--диспетчер задач для linux  '
sleep 10
sudo pacman -S htop xterm
sleep 10
echo ' gwenview - программа для просмотра изображений и PDF, калькулятор'
sleep 10
sudo pacman -S gwenview okular kcalc
sleep 10
echo ' Ставим Steam   '
sudo pacman -S steam
sleep 10
echo 'Ставим neofetch screenfetch'
sleep 10
sudo pacman -S screenfetch neofetch
sleep 10
echo 'Ставим VLC'
sleep 10
sudo pacman -S vlc
sleep 10
echo 'Ставим gparted - программу для работы с разделами sdd/hdd'
sleep 10
sudo pacman -S gparted
sleep 10
echo 'Ставим telegram - мессенджер'
sleep 10
sudo pacman -S telegram-desktop
sleep 10
echo 'Ставим программы для создания скриншотов'
sleep 10
sudo pacman -S spectacle flameshot
sleep 10

 
echo 'Ставим reflector'
sleep 10
sudo pacman -S reflector

sleep 10
echo 'Ставим zsh'

sudo pacman -S zsh

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
exit
