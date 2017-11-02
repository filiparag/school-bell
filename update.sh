#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

GIT_STATUS=`git pull`

if [ "$GIT_STATUS" != "Already up-to-date." ]
then

    echo "Update available, fetching from GitHub..."

    git reset --progress --hard >> $DIR/updates.txt
    git pull --progress >> $DIR/updates.txt

    echo "Update applied successfully!"

    SERVICE_RUNNING=`systemctl is-active school-bell >/dev/null 2>&1 && echo YES || echo NO`
    if [ "$SERVICE_RUNNING" == "YES" ]
    then
        echo "Restarting systemd service."
        systemctl restart school-bell.service
    fi

else

    echo "Already at the latest version!"

fi