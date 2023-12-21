#!/bin/bash
read -sp "Можно закрыть все програмы. Для продолжения нажать Enter. После система перезагрузиться или вы сможете перезагрузить её позже сами. Не отходите от системы она может запрашивать пароль sudo и часто спрашивает подтверждение"
read -p "Обновить систему? [y/N]" answer
if [ $answer == *"y"* ]; then
	sudo pacman -Syu --noconfirm git make --needed
fi
mkdir .cache/
 git clone https://aur.archlinux.org/yay.git
 cd yay
 makepkg -sric
 cd ..
sudo rm -rf yay

read -p "Программа для оптимизация процессора [y/n]" answer
if [ $answer == *"n"* ]; then
	echo "Скип"
else
	cd .cache/
	git clone https://aur.archlinux.org/auto-cpufreq.git
	cd auto-cpufreq
	makepkg -sric
	sudo systemctl enable auto-cpufreq                             
	sudo systemctl start auto-cpufreq
	cd ..
	sudo rm -rf auto-cpufreq
	cd
fi

read -p "Установить wine? [y/N]" answer
if [ $answer == *"n"* ]; then
	echo "Установка wine"
	sudo pacman -S wine-staging winetricks wine-mono giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader lutris --needed
else
	echo "Скип"
fi

echo "Твики для игр"
sudo pacman -S --noconfirm --needed gamemode lib32-gamemode

read -p "Оптимизация ssd [y/n]" answer
if [[ $answer == *"n"* ]]; then
	echo "Скип"
else
	sudo systemctl enable fstrim.timer
	sudo fstrim -v /
	sudo fstrim -va /
fi

read -p "Установить твики драйвера Nvidia? [y/n]" answer
if [[ $answer == *"n"* ]]; then
	echo "Скип"
else
	cd .cache/
	git clone https://aur.archlinux.org/nvidia-tweaks.git
	cd nvidia-tweaks
	makepkg -sric
	cd ..
	rm -rf nvidia-tweaks
	cd
fi

read -p "устоновка google-chrome [y/n]" answer
if [[ $answer == *"n"* ]]; then
	echo "Скип"
else
	yay -S google-chrome 
fi


read -p "устоновить steam [y/n]" answer
if [[ $answer == *"n"* ]]; then
	echo "Скип"
else
	sudo pacman -S steam
fi



read -p "Ускоренный запуск [y/n]" answer
if [[ $answer == *"n"* ]]; then
	echo "Скип"
else
	cd .cache/
	git clone https://aur.archlinux.org/ananicy.git 
	cd ananicy                                     
	makepkg -sric
	sudo systemctl enable --now ananicy
	cd .. 
	sudo rf -rf ananicy
	cd
fi
# yay -Syuuu --noconfirm
# yay -S --noconfirm Octopi

read -p "Перезагрузка [y/n]" answer
if [[ $answer == *"n"* ]]; then
	echo "Перезагрузитесь"
else
	reboot
fi
