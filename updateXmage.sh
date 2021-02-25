#!/bin/bash

# Download and extract latest xmage release
LOCATION=$(curl -s https://api.github.com/repos/magefree/mage/releases/latest \
| grep "tag_name" \
| awk '{print "https://github.com/magefree/mage/releases/download/" substr($2, 2, length($2)-3) "/" substr($2, 2, length($2)-3) ".zip"}') \
; curl -L -o xmage.zip $LOCATION
unzip -o xmage.zip
# Replace default settings with your settings
sed -i -e "s/serverAddress=\"0.0.0.0\"/serverAddress=\"{YOUR SERVER ADDRESS}\"/g" ./mage-server/config/config.xml
sed -i -e "s/serverName=\"mage-server\"/serverName=\"{YOUR SERVER NAME}\"/g" ./mage-server/config/config.xml
sed -i -e "s/secondaryBindPort=\"-1\"/secondaryBindPort=\"{YOUR SECONDARY BIND PORT}\"/g" ./mage-server/config/config.xml
sed -i -e "s/maxSecondsIdle=\"600\"/maxSecondsIdle=\"{YOUR MAX SECONDS IDLE}\"/g" ./mage-server/config/config.xml
sed -i -e "s/maxAiOpponents=\"15\"/maxAiOpponents=\"{YOUR MAX AI OPPONENTS}\"/g" ./mage-server/config/config.xml
dos2unix ./mage-server/config/config.xml
# Increase amount of RAM server can use.
sed -i -e "s/-Xms256M -Xmx512M/-Xms512M -Xmx1024M/g" ./mage-server/startServer.sh 
dos2unix ./mage-server/startServer.sh
# Set permissions and reboot
sudo chmod 755 ./mage-server/startServer.sh
sudo reboot now