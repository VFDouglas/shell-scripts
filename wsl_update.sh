# Check the last time WSL was updated
if [ -f ~/last_wsl_update.txt ]; then
    last_update_time=$(cat ~/last_wsl_update.txt)
else
    last_update_time=0
fi

# Difference between last update and the current timestamp
diff=$(expr $EPOCHSECONDS - $last_update_time)
# Difference greather or equal than 12 hours
if [ $diff -ge 43200 ]; then
    echo 'Updating WSL.'
    sudo apt update -y
    sudo apt upgrade -y
    # Updates the file with the current timestamp
    echo $EPOCHSECONDS > ~/last_wsl_update.txt
fi
