#!/bin/bash
read -p "Введите имя компьютера: " hostname
read -p "Введите имя пользователя: " username

echo 'Прописываем имя компьютера'
echo $hostname > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc --localtime

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
pacman -S grub efibootmgr os-prober mtools fuse git --noconfirm
grub-install /dev/sdb

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
pacman -S xorg xorg-server xorg-drivers xorg-xinit --noconfirm

echo "Ставим PLASMA KDE"

pacman -S plasma --noconfirm

pacman -Rs bluedevil discover ksshaskpass plasma-sdk plasma-thunderbolt --noconfirm

echo 'Cтавим DM'

pacman -S sddm sddm-kcm --noconfirm

echo 'Создаем директории'

pacman -S xdg-user-dirs --noconfirm

echo ' Ставим Konsole dolphin gpm kate'

pacman -S konsole dolphin gpm kate --noconfirm


echo 'Ставим сеть'

pacman -S networkmanager network-manager-applet ppp wget  --noconfirm


echo 'Подключаем автозагрузку менеджера входа и интернет'

systemctl enable NetworkManager gpm sddm

echo 'Установка завершена! Перезагрузите систему.'
exit

