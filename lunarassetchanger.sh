#!/bin/sh
if [[ $EUID -eq 0 ]]; then
    echo -e ${RED}ERROR "Do not run this as super user"
    exit
elif [ -d "/home/$USER/.lunarclient" ]; then
echo Found Lunar Client
echo Please Type In The Version You Would Like To Modify
read ver
if cd /home/$USER/.lunarclient/offline/$ver/; then
extracting lunar-assets-prod-3-optifine.jar
rm -rf /home/$USER/.lunarclient/offline/$ver/assets /home/$USER/.lunarclient/offline/$ver/META-INF /home/$USER/.lunarclient/offline/$ver/javafx-swt.jar
unzip lunar-assets-prod-3-optifine.jar
sleep 2;
clear
echo Successfully extracted Lunar Client Assets For $ver!
mkdir ~/Lunar-Assets/
mkdir ~/Lunar-Assets/$ver/
cp -r ~/.lunarclient/offline/$ver/assets ~/Lunar-Assets/$ver/
cp -r ~/.lunarclient/offline/$ver/META-INF ~/Lunar-Assets/$ver
cp ~/.lunarclient/offline/$ver/javafx-swt.jar ~/Lunar-Assets/$ver
touch ~/Lunar-Assets/$ver/build.sh
echo '#!/bin/bash
echo please enter the name of this folder/the version you extracted
read ver
zipf assets/ META-INF/ javafx-swt.jar
rename *.zip lunar-assets-prod-3-optifine.jar *.zip
rm ~/.lunarclient/offline/$ver/lunar-assets-prod-3-optifine.jar
cp lunar-assets-prod-3-optifine.jar ~/.lunarclient/offline/$ver/' >> ~/Lunar-Assets/$ver/build.sh
sleep 3;
echo Running Your Default File Manager...
sleep 1;
xdg-open ~/Lunar-Assets/$ver
else
clear
echo please type in a valid number
sleep 1;
exec "$0" "$@"
fi
fi
exit
