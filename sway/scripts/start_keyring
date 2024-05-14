#!/usr/bin/env bash
pkill -f --signal SIGTERM gnome-keyring-daemon
gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
echo -n "" | secret-tool store --label='unlocker' "unlocker" "unlocker"
