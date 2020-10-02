#!/bin/bash
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm
yay -S google-chrome --noconfirm
sudo pacman -S zsh --noconfirm
chsh -s /bin/zsh
zsh
echo 'Ставим Видео драйвер'

pacman -S nvidia nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader--noconfirm

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
yay -S conky-manager2 conky-cairo --noconfirm

wget git.io/conky.tar.gz
tar -xzf conky.tar.gz -C ~/

exit
