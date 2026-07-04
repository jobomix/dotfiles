#!/bin/sh

if [ "$(acpi -a)" == "Adapter 0: on-line" ]
then
hyprctl --instance 0 dispatch 'hl.monitor({output="eDP-1",disabled=true})'
fi
