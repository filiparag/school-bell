#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

sudo mv .gpio_state /tmp/.gpio_state

sudo rm * -rf
sudo git reset --hard

GIT_STATUS=`sudo git pull`

if [ "$GIT_STATUS" != "Already up-to-date." ]
then

    echo "Update available, fetching from GitHub..."

    git reset --hard >> $DIR/updates.txt
    git pull --progress >> $DIR/updates.txt

    echo "Update applied successfully!"

    SERVICE_RUNNING=`systemctl is-active school-bell >/dev/null 2>&1 && echo YES || echo NO`
    if [ "$SERVICE_RUNNING" == "YES" ]
    then
        echo "Stopping systemd service."
        sudo systemctl stop school-bell.service
        echo "Starting systemd service with applied update."        
        sudo systemctl start school-bell.service
    fi

else

    echo "Already at the latest version!"

fi

sudo mv /tmp/.gpio_state .gpio_state