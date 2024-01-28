echo "эх удоляю. ваши фаелы тоже кхе. шучу" 

sleep 10
sed -i s/'#en_US.UTF-8'/'en_US.UTF-8'/g /etc/locale.gen
sed -i s/'#ru_RU.UTF-8'/'ru_RU.UTF-8'/g /etc/locale.gen
echo 'LANG=ru_RU.UTF-8' > /etc/locale.conf
echo 'KEYMAP=ru' > /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf
setfont cyr-sun16
locale-gen >/dev/null 2>&1; RETVAL=$?
systemctl restart dhcpcd
dhcpcd
clear 
echo "ЖДИТЕ"
sleep 20



	sudo systemctl stop auto-cpufreq
sudo systemctl disable auto-cpufreq                             
clear
sudo pacman -R nvidia-tweaks
clear 

systemctl stop --now ananicy
systemctl disable ananicy
clear 
sudo reboot
