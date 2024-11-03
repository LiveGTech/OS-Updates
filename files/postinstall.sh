#!/bin/bash

# gShell
# 
# Copyright (C) LiveG. All Rights Reserved.
# 
# https://liveg.tech
# Licensed by the LiveG Open-Source Licence, which can be found at LICENCE.md.

pushd /system/storage/update

sed -i "s|startx /system/scripts/xload.sh > /dev/null 2>&1|startx /system/scripts/xload.sh -- -nocursor > /dev/null 2>\\&1|" /system/scripts/startup.sh

chmod +x /system/scripts/xload.sh

# Fixes https://github.com/LiveGTech/OS-Updates/issues/1
chmod -R o-w /system

find /system \
    -not -path "/system/control/*" \
    -and -not -path "/system/storage/users/*/files/*" \
    -and -not -path "/system/.cache/*" \
    -and -not -path "/system/.config/gshell/Partitions/*" \
    -and -not -path "/system/.config/gshell/Cache/*" \
    -exec chmod o-w {} \;

popd