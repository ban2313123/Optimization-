#!/bin/bash

read -sp " Не отходите от системы она может запрашивать пароль sudo "
read -p "Обновить систему? [y/N]" answer
sleep 3
if [ $answer == *"n"* ]; then
	sudo pacman -Syu --noconfirm git make --needed
fi
mkdir cache



read -p "Программа для оптимизация процессора работает токо для inetel  [y/n]" answer
sleep 2
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

read -p "Установить wine? wine жто программа которая позволяет некоторые программы винловс запускать на линукс. [y/N]" answer
if [ $answer == *"n"* ]; then
	echo "Установка wine"
	sleep 3
	sudo pacman -S  gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader  gamemode lib32-gamemode --needed
	sudo pacman -S  wine-staging winetricks wine-mono giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal --noconfirm
	sudo pacman -S lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib --noconfirm
	sudo pacman -S 	 lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama --noconfirm
	sudo pacman -S ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 --noconfirm
else

	echo "Скип"
fi


read -p "Оптимизация ssd не использовать если у вас hdd  [y/n]" answer  
sleep 2
if [[ $answer == *"n"* ]]; then
	echo "Скип"
else
	sudo systemctl enable fstrim.timer
	sudo fstrim -v /
	sudo fstrim -va /
fi

read -p "Установить твики драйвера Nvidia? [y/n]" answer
sleep 3
if [[ $answer == *"n"* ]]; then
	echo "Скип"
else
	cd .cache/
	git clone https://aur.archlinux.org/nvidia-tweaks.git
	cd nvidia-tweaks
	makepkg -sric
	cd ..
	sudo rm -rf nvidia-tweaks
	cd
fi

read -p "устоновка google-chrome требуется yay [y/n]" answer
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
sleep 4
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
echo "шутите? АНУ БЫСТРО НА РЕБУт"
    sleep 4
	reboot 
	
else
	reboot
fi
