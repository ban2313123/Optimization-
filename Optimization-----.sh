#!/bin/bash
echo просьба закрыть все програамы. для продолжения нажать энтер. ПОСЛЕ СИСТЕМА РЕБУТНИЦА. Не отходите от системы она может запрашивать пароль sudo
read -s -p спасибо
echo запуск обновление системы
sudo pacman -Syuuu --noconfirm
echo установка программ 
sudo pacman -S  --noconfirm git make
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sric
cd ..
sudo rm -rf yay
cd
echo оптимизация процессора 
git clone https://aur.archlinux.org/auto-cpufreq-git.git   
cd auto-cpufreq-git                                       
makepkg -sric           
sudo systemctl enable auto-cpufreq                             
sudo systemctl start auto-cpufreq
cd ..
sudo rm -rf auto-cpufreq
cd



read -p "установить wine?Введите yes или no: " answer

if [[ "$answer" == "yes" ]]; then
    echo "Вы ввели yes"
    echo начата установка wine
sudo pacman -S wine-staging winetricks wine-mono giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader lutris
"yes"
elif [[ "$answer" == "no" ]]; then
    echo хорошо скип
   else
   fi


echo твики для игр
sudo pacman -S --noconfirm gamemode lib32-gamemode

echo оптимизация ssd
sudo systemctl enable fstrim.timer            
sudo fstrim -v /                                  
sudo fstrim -va /


read -p "установить твики драйвера Nvidia?видите yes либо no.  " answer

if [[ "$answer" == "yes" ]]; then
    echo "Вы ввели yes"
    git clone https://aur.archlinux.org/nvidia-tweaks.git 
cd nvidia-tweaks                  
makepkg -sric
cd ..
rm -rf nvidia-tweaks
cd 
elif [[ "$answer" == "no" ]]; then
    echo "Вы ввели no"
     echo скип
     
else

fi    

echo ускореный запуск
git clone https://aur.archlinux.org/ananicy.git 
cd ananicy                                     
makepkg -sric
sudo systemctl enable --now ananicy
cd .. 
sudo rf -rf ananicy
cd
sudo rm -rf Optimization 
yay -Syuuu --noconfirm
yay -S --noconfirm Octopi

reboot
