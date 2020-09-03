loadkeys ru
setfont cyr-sun16


pacman-key --refresh-keys

echo '2.3 Синхронизация системных часов'
timedatectl set-ntp true

echo 'Ваша разметка диска'

fdisk -l

echo '2.4 создание разделов'
cfdisk /dev/sdd
echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sdd1
mkfs.ext4  /dev/sdd2
mkfs.ext4  /dev/sdd3

echo '2.4.3 Монтирование дисков'
mount /dev/sdd2 /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount /dev/sdd1 /mnt/boot/efi
mount /dev/sdd3 /mnt/home

echo '3.1 Выбор зеркал для загрузки.'
nano /etc/pacman.d/mirrorlist


echo '3.2 Установка основных пакетов'
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl

echo '3.3 Настройка системы'
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL git.io/archuefi2.sh)"
