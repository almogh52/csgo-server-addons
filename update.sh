# Get the script's path
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Update the server app using steamcmd
../steamcmd/steamcmd.sh +login anonymous +force_install_dir $SCRIPTPATH +app_update 740 +quit

# Download metamod and sourcemod
cd csgo
curl -sqL "https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git966-linux.tar.gz" | tar zxvf -
curl -sqL "https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6266-linux.tar.gz" | tar zxvf -

# Check if the data folder already exists, if it exists, save it as data-backup
DATA_DIR=$SCRIPTPATH/csgo/addons/sourcemod/data
if [ -d $DATA_DIR ]; then
    # Change the name of the directory to data-backup
    mv $DATA_DIR "$DATA_DIR-backup"
fi

# Download addons
cd ..
curl -sqL "https://gitlab.com/almogh52/csgo-server-addons/-/archive/master/csgo-server-addons-master.tar.gz" | tar --transform 's,csgo-server-addons-master,.,' --show-transformed -zxvf -

# Check if the saved data backup folder exists, if it is, set it as the data
if [ -d "$DATA_DIR-backup" ]; then
    # Remove the downloaded data folder
    rm -rf $DATA_DIR

    # Change the name of the directory back to data
    mv "$DATA_DIR-backup" $DATA_DIR
fi