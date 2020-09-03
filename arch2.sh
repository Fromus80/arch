#!/bin/bash
read -p "Введите имя компьютера: " hostname
read -p "Введите имя пользователя: " username

echo 'Прописываем имя компьютера'
echo $hostname > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
sleep 10
echo '3.4 Добавляем русскую локаль системы'
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 
sleep 10
echo 'Обновим текущую локаль системы'
locale-gen
sleep 10
echo 'Указываем язык системы'
echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf
sleep 10
echo 'Вписываем KEYMAP=ru FONT=cyr-sun16'
echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

echo 'Создадим загрузочный RAM диск'
mkinitcpio -p linux
sleep 10
echo '3.5 Устанавливаем загрузчик'
pacman -Syy
sleep 10
pacman -S grub efibootmgr grub-customizer os-prober --noconfirm
sleep 10
grub-install /dev/sdd

echo 'Обновляем grub.cfg'
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
pacman -Syy
sleep 10
echo 'Ставим иксы и драйвера'
sleep 10
pacman -S xorg-server xorg-drivers xorg-xinit
sleep 10
pacman -S amd-ucode

echo "Ставим KDE"
sleep 10
pacman -S plasma conky conky-manager

echo 'Cтавим DM'
pacman -S sddm sddm-kcm --noconfirm
systemctl enable sddm

echo 'Ставим шрифты'
pacman -S ttf-liberation ttf-dejavu ttf-arphic-ukai git ttf-liberation ttf-dejavu ttf-arphic-uming ttf-fireflysung ttf-sazanami xdg-user-dirs f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils file-roller p7zip unrar gvfs aspell-ru pulseaudio pavucontrol --noconfirm
echo 'Ставим проги'
pacman -S qbittorrent kcal reflector konsole alsa-utils pulseaudio-equalizer-ladspa exfat-utils ntfs-3g unzip unrar  lha ark file-roller p7zip unace lrzip gvfs-afc gvfs-mtp htop xterm gwenview steam neofetch screenfetch vlc gparted telegram-desktop spectacle flameshot --noconfirm 
echo 'Ставим сеть'
pacman -S networkmanager network-manager-applet ppp --noconfirm
sleep 10
echo 'Подключаем автозагрузку менеджера входа и интернет'
systemctl enable NetworkManager

echo 'Установка завершена! Перезагрузите систему.'
