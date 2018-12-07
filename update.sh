# Get the script's path
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Update the server app using steamcmd
./steamcmd +login anonymous +force_install_dir $SCRIPTPATH +app_update 740 validate +quit

# Download addons
curl -sqL "https://gitlab.com/almogh52/csgo-server-addons/-/archive/master/csgo-server-addons-master.tar.gz" | tar --transform 's,csgo-server-addons-master,.,' --show-transformed -zxvf -

# Move to the csgo folder to download sourcemod
cd csgo

# Download sourcemod
curl -sqL "https://sm.alliedmods.net/smdrop/1.9/sourcemod-1.9.0-git6266-linux.tar.gz" | tar zxvf -