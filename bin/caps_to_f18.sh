#!/usr/bin/bash
xmodmap -e "remove Lock = Caps_Lock" -e "keysym Caps_Lock = F18"
echo Caps Lock is now mapped to F18 key.
