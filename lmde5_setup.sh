#!/bin/bash

### TODO
### Fix LMDE package sources at start and what to change them to after as these are based off LinuxMint
### Prompt to reboot Y/N
### Redshift Startup

install_path=$(pwd)

sudo sed -i 's/http:\/\/packages.linuxmint.com/https:\/\/mirror.cs.jmu.edu\/pub\/linuxmint\/packages/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo sed -i 's/https:\/\/deb.debian.org\/debian/http:\/\/debian.gtisc.gatech.edu\/debian/g' /etc/apt/sources.list.d/official-package-repositories.list

sudo apt-get update
sudo apt-get upgrade -y

#TOTAL APPS BEING ADDED TO INSTALLATION
total=37

clear
echo ""
echo Installing 1/$total openssh-server...  Please be patient...
echo ""
echo ""
sudo apt-get install openssh-server -y

clear
echo ""
echo Installing 2/$total vim...  Please be patient...
echo ""
echo ""
sudo apt-get install vim -y

clear
echo ""
echo Installing 3/$total chromium...  Please be patient...
echo ""
echo ""
sudo apt-get install chromium -y

clear
echo ""
echo Installing 4/$total gtkhash...  Please be patient...
echo ""
echo ""
sudo apt-get install gtkhash -y

clear
echo ""
echo Installing 5/$total remmina...  Please be patient...
echo ""
echo ""
#use for SSH and RDP connections
sudo apt-get install remmina -y

clear
echo ""
echo Installing 6/$total remmina-plugin-rdp...  Please be patient...
echo ""
echo ""
sudo apt-get install remmina-plugin-rdp -y

clear
echo ""
echo Installing 7/$total remmina-plugin-vnc...  Please be patient...
echo ""
echo ""
sudo apt-get install remmina-plugin-vnc -y

clear
echo ""
echo Installing 8/$total scribus...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus -y

clear
echo ""
echo Installing 9/$total scribus-template...  Please be patient...
echo ""
echo ""
sudo apt-get install scribus-template -y

clear
echo ""
echo Installing 10/$total sublime-text...  Please be patient...
echo ""
echo ""
sudo apt-get install sublime-text -y

clear
echo ""
echo Installing 11/$total dos2unix...  Please be patient...
echo ""
echo ""
sudo apt-get install dos2unix -y

clear
echo ""
echo Installing 12/$total keepass2...  Please be patient...
echo ""
echo ""
sudo apt-get install keepass2 -y

clear
echo ""
echo Installing 13/$total conky-all...  Please be patient...
echo ""
echo ""
sudo apt-get install conky-all -y

clear
echo ""
echo Installing 14/$total vnstat...  Please be patient...
echo ""
echo ""
#required by conky network statistics section
sudo apt-get install vnstat -y

clear
echo ""
echo Installing 15/$total psensor...  Please be patient...
echo ""
echo ""
#graphical sensor monitor
sudo apt-get install psensor -y

clear
echo ""
echo Installing 16/$total tree...  Please be patient...
echo ""
echo ""
#helps determine system monitors for conky
sudo apt-get install tree -y

clear
echo ""
echo Installing 17/$total python-pip...  Please be patient...
echo ""
echo ""
sudo apt-get install python-pip -y

clear
echo ""
echo Installing 18/$total python3-tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install python3-tk -y

clear
echo ""
echo Installing 19/$total tk...  Please be patient...
echo ""
echo ""
#test ‘python3’ tkinkter app before install
sudo apt-get install tk -y

clear
echo ""
echo Installing 20/$total docker.io...  Please be patient...
echo ""
echo ""
sudo apt-get install docker.io -y

clear
echo ""
echo Installing 21/$total sqlitebrowser...  Please be patient...
echo ""
echo ""
sudo apt-get install sqlitebrowser -y

clear
echo ""
echo Installing 22/$total pdfshuffler...  Please be patient...
echo ""
echo ""
#Merge or Split PDF Documents
sudo apt-get install pdfshuffler -y

clear
echo ""
echo Installing 23/$total okular...  Please be patient...
echo ""
echo ""
#Document Reader - PDF’s, etc
sudo apt-get install okular -y

clear
echo ""
echo Installing 24/$total kleopatra...  Please be patient...
echo ""
echo ""
sudo apt-get install kleopatra -y

clear
echo ""
echo Installing 25/$total mysql-workbench...  Please be patient...
echo ""
echo ""
sudo apt-get install mysql-workbench -y

clear
echo ""
echo Installing 26/$total steam...  Please be patient...
echo ""
echo ""
#Steam Gaming
sudo apt-get install steam -y

clear
echo ""
echo Installing 27/$total cmatrix...  Please be patient...
echo ""
echo ""
#cmatrix turns terminal into matrix terminal
sudo apt-get install cmatrix -y

clear
echo ""
echo Installing 28/$total krita...  Please be patient...
echo ""
echo ""
#Professional Paint Program
sudo apt-get install krita -y

clear
echo ""
echo Installing 29/$total cheese...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt-get install cheese -y

clear
echo ""
echo Installing 30/$total guvcview...  Please be patient...
echo ""
echo ""
#Camera Software
sudo apt-get install guvcview -y

clear
echo ""
echo Installing 31/$total gftp...  Please be patient...
echo ""
echo ""
sudo apt-get install gftp -y

clear
echo ""
echo Installing 32/$total handbrake...  Please be patient...
echo ""
echo ""
sudo apt-get install handbrake -y

clear
echo ""
echo Installing 33/$total virtualbox...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox -y

clear
echo ""
echo Installing 34/$total virtualbox-guest-additions-iso...  Please be patient...
echo ""
echo ""
sudo apt-get install virtualbox-guest-additions-iso -y

clear
echo ""
echo Installing 35/$total falkon...  Please be patient...
echo ""
echo ""
sudo apt-get install falkon -y

clear
echo ""
echo Installing 36/$total xrdp...  Please be patient...
echo ""
echo ""
#Allows RDP Connections to Linux
sudo apt-get install xrdp -y
sudo adduser xrdp ssl-cert

clear
echo ""
echo Modifying Grub Menu to not display...  Please be patient...
echo ""
echo ""
sudo sed -i 's/GRUB_TIMEOUT=10/GRUB_TIMEOUT=0/g' /etc/default/grub
sudo update-grub

clear
echo ""
read -p "Is this a Dell Latitude E6530 that requires NVidia 340 Drivers... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
	echo ""
	echo "Installing NVidia-340 Drivers...  Please be patient..."
  echo ""
  echo ""
  sudo apt-get install nvidia-340 -y

else
	cancel
fi

clear
echo ""
read -p "Does this machine need Synergy setup to connect to Synergy Server...  Say NO for Virtual Machine setup... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo ""
  echo " Enter the Synergy Server Hostname"
  echo ""
  echo ""
  read synergy_host
  echo ""
  echo ""
  echo Setting up Synergy...  Please be patient...
  echo ""
  echo ""
  sudo gdebi $install_path/synergy_1.14.5-stable.a975f61a_ubuntu20_amd64.deb
  echo -e "\ngreeter-setup-script=/usr/bin/synergyc $synergy_host" | sudo tee -a /etc/lightdm/lightdm.conf.d/70-linuxmint.conf
  echo ""
  echo ""
  
else
	cancel
fi

PS3="Select the conky file to use: "

clear
echo ""
echo ""

select opt in vm e6530 macpro quit; do

  case $opt in
    vm)
      cp $install_path/.conkyrc_vm ~/.conkyrc
      break
      ;;
    e6530)
      cp $install_path/.conkyrc_e6530 ~/.conkyrc
      break
      ;;
    macpro)
      cp $install_path/.conkyrc_macpro ~/.conkyrc
      break
      ;;
    quit)
      break
      ;;
    *)
      echo "Invalid option $REPLY"
      ;;
  esac
done

mv $install_path/2.json ~/.cinnamon/configs/grouped-window-list@cinnamon.org/
mv $install_path/linuxmint.png ~/Pictures/
mv $install_path/StartupConky.desktop ~/.config/autostart/

sudo mv $install_path/sun-hours_etc_cron.daily /etc/cron.daily/sun-hours
sudo chown root.root /etc/cron.daily/sun-hours
sudo chmod 755 /etc/cron.daily/sun-hours

sudo mv $install_path/sun-hours_usr_local_bin /usr/local/bin/sun-hours
sudo chown root.root /usr/local/bin/sun-hours
sudo chmod 755 /usr/local/bin/sun-hours

echo ""
echo ""
echo Getting current Sunset and Sunrise times...  Please be patient...
sudo /usr/local/bin/sun-hours
sleep 10

#Testing to see if this step is needed since we are rebooting and if will fix sunrise-sunset issue not running...
#sudo /etc/init.d/cron restart

gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/linuxmint/ktee_linuxmint.png'

clear
echo ""
read -p "Does this machine have plenty of drive space for timeshift setup...  Say NO for Virtual Machine setup... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo Setting up Timeshift and taking first snapshot...  Please be patient...
  echo ""
  echo ""
  sudo timeshift --create --rsync --comment "Base Install Snapshot" --yes
  sudo sed -i 's/"schedule_weekly" : "false"/"schedule_weekly" : "true"/g' /etc/timeshift/timeshift.json

else
	cancel
fi

clear
echo ""
echo "Setup Complete - Machine will reboot in 30 seconds"
sleep 30

sudo reboot
