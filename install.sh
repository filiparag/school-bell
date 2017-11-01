#! /bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

read -p "This script will add school-bell to systemd services. Continue [y/N]: " choice
case "$choice" in 
  y|Y ) ;;
  n|N|* ) exit;;
esac

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SERVICE_DIR="/etc/systemd/system"
SYSTEMD_SERVICE_FILE="
[Unit]                                              \n
Description=School bell service                     \n
                                                    \n
[Service]                                           \n
Type=oneshot                                        \n
ExecStart=/usr/bin/env python3 $DIR/school_bell.py  \n
                                                    \n
[Install]                                           \n
WantedBy=multi-user.target"

echo -e $SYSTEMD_SERVICE_FILE > "$SERVICE_DIR/school-bell.service"

read -p "Enable school-bell service [y/N]: " choice
case "$choice" in 
  y|Y ) systemctl enable school-bell.service;;
  n|N|* ) ;;
esac

CRON_DIR="/etc/cron.hourly/"
CROJ_JOB_FILE="
#! /bin/bash                                        \n
/usr/bin/env bash $DIR/update.sh"

read -p "Enable automatic updates from the developer [y/N]: " choice
case "$choice" in 
  y|Y ) echo -e $CROJ_JOB_FILE > "$CRON_DIR/school-bell.sh" && chmod +x $CRON_DIR/school-bell.sh;;
  n|N|* ) exit;;
esac

read -p "Start school-bell service [y/N]: " choice
case "$choice" in 
  y|Y ) systemctl start school-bell.service;;
  n|N|* ) exit;;
esac