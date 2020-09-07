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
sleep 10
echo '3.5 Устанавливаем загрузчик'
sleep 10
pacman -Syy
pacman -S grub efibootmgr os-prober mtools fuse grub-customizer
grub-install /dev/sdd

sleep 10
echo 'Обновляем grub.cfg'
sleep 10
grub-mkconfig -o /boot/grub/grub.cfg 
sleep 10
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
sleep 10
pacman -S plasma 
sleep 10
echo 'Cтавим DM'
sleep 10
pacman -S sddm sddm-kcm
systemctl enable sddm
sleep 10
echo ' Ставим Konsole dolphin'
sleep 10
pacman -S konsole dolphin
sleep 10
echo 'Ставим шрифты'
sleep 10
pacman -S ttf-arphic-ukai git ttf-liberation ttf-dejavu ttf-arphic-uming ttf-fireflysung ttf-sazanami
sleep 10
echo 'Ставим звук'
sleep 10
pacman -S alsa-utils pulseaudio-equalizer-ladspa
sleep 10
echo 'Ставим Видео драйвер'
sleep 10
pacman -S nvidia  nvidia-utils  lib32-nvidia-utils
sleep 10
echo ' Ставим  поддержку ntfs и fat'
sleep 10
pacman -S exfat-utils ntfs-3g
sleep 10
echo ' Ставим рограммы для работы с архивами'
sleep 10
pacman -S file-roller p7zip unace lrzip unzip unrar lha ark
sleep 10
echo ' Ставим подключение Android к ПК через USB? '
sleep 10
pacman -S gvfs-mtp
sleep 10
echo ' htop--диспетчер задач для linux  '
sleep 10
pacman -S htop xterm
sleep 10
echo ' gwenview - программа для просмотра изображений и PDF'
sleep 10
pacman -S gwenview okular kcal
sleep 10
echo ' Ставим Steam   '
pacman -S steam
sleep 10
echo 'Ставим neofetch screenfetch'
sleep 10
pacman -S screenfetch neofetch
sleep 10
echo 'Ставим VLC'
sleep 10
pacman -S vlc
sleep 10
echo 'Ставим gparted - программу для работы с разделами sdd/hdd'
sleep 10
pacman -S gparted
sleep 10
echo 'Ставим telegram - мессенджер'
sleep 10
pacman -S telegram-desktop
sleep 10
echo 'Ставим программы для создания скриншотов'
sleep 10
pacman -S spectacle flameshot
sleep 10
echo 'Создаем директории'
sleep 10
pacman -S xdg-user-dirs
sleep 10
pacman -R discover --noconwirm
echo 'Ставим Conky'
sleep 10
pacman -S conky conky-manager reflector
sleep 10
echo 'Ставим сеть'
sleep 10
pacman -S networkmanager network-manager-applet ppp wget qbittorrent

sleep 10
echo 'Подключаем автозагрузку менеджера входа и интернет'
sleep 10
systemctl enable NetworkManager
sleep 10
echo 'Установка завершена! Перезагрузите систему.'
sleep 10
echo 'Если хотите подключить AUR, установить мои конфиги XFCE, тогда после перезагрзки и входа в систему, установите wget (sudo pacman -S wget) и выполните команду:'
echo 'wget git.io/archuefi3.sh && sh archuefi3.sh'
sleep 10
reboot
exit

