#!/bin/bash
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm
yay -S google-chrome --noconfirm
sudo pacman -S zsh --noconfirm
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

chsh -s /bin/zsh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

exit
