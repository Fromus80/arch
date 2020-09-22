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

echo '3.5 Устанавливаем загрузчик'

pacman -Syy
pacman -S grub efibootmgr os-prober mtools fuse --noconfirm
grub-install /dev/sdd

echo 'Обновляем grub.cfg'

grub-mkconfig -o /boot/grub/grub.cfg 

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

pacman -Syu

echo 'Ставим иксы и драйвера'
pacman -S xorg-server xorg-drivers xorg-xinit amd-ucode --noconfirm

echo "Ставим PLASMA KDE"

pacman -S plasma --noconfirm

pacman -Rs bluedevil discover --noconfirm

echo 'Cтавим DM'

pacman -S sddm sddm-kcm --noconfirm
systemctl enable sddm
echo 'Создаем директории'

pacman -S xdg-user-dirs --noconfirm

echo ' Ставим Konsole dolphin gpm'

pacman -S terminator dolphin gpm kate --noconfirm

echo 'Ставим шрифты'

pacman -S ttf-arphic-ukai git ttf-liberation ttf-dejavu ttf-arphic-uming ttf-fireflysung ttf-sazanami --noconfirm

echo 'Ставим звук'

pacman -S alsa-utils pulseaudio-equalizer-ladspa --noconfirm

echo 'Ставим Видео драйвер'

pacman -S nvidia nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader--noconfirm

echo 'Ставим сеть и торрент'

pacman -S networkmanager network-manager-applet ppp wget qbittorrent --noconfirm


echo 'Подключаем автозагрузку менеджера входа и интернет'

systemctl enable NetworkManager gpm

echo 'Установка завершена! Перезагрузите систему.'


exit

