#!/bin/bash

# gShell
# 
# Copyright (C) LiveG. All Rights Reserved.
# 
# https://liveg.tech
# Licensed by the LiveG Open-Source Licence, which can be found at LICENCE.md.

pushd /system/storage/update

tee /system/logs/update-preinstall.log << EOF
PLATFORM=$PLATFORM
MODEL_CODENAME=$MODEL_CODENAME
VERNUM=$VERNUM
VERSION=$VERSION
OLD_VERNUM=$OLD_VERNUM
OLD_VERSION=$OLD_VERSION
EOF

mkdir -p /usr/share/gtk-3.0

sudo sed -i -e "s|rm /system/gshell-staging-ready|rm -f /system/gshell-staging-ready|g" /system/scripts/startup.sh

if [ "$OLD_VERNUM" -le 4 ]; then
    sudo apt install -y fonts-urw-base35=20200910-7

    sudo rm -rf /usr/share/themes/Adapt-UI-Linux
    sudo mkdir -p /usr/share/themes/Adapt-UI-Linux
    sudo tar -xzf Adapt-UI-Linux.tar.gz -C /usr/share/themes/Adapt-UI-Linux

    if [ "$PLATFORM" == "x86_64" ]; then
        sudo tee -a /etc/systemd/logind.conf << EOF
HandlePowerKey=ignore
EOF
    fi

    if [ "$PLATFORM" == "rpi" ]; then
        sudo tee -a /boot/firmware/config.txt << EOF
framebuffer_depth=32
EOF
    fi
fi

popd
