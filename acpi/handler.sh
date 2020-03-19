#!/bin/sh
#
# ACPI event handler.

export DISPLAY=:0
export PATH=$PATH:/home/lieu/.local/bin

case $1 in
    button/micmute*)
        amixer sset Capture toggle
    ;;

    button/mute*)
        amixer sset Master toggle
    ;;

    button/volumedown*)
        amixer sset Master 5%-
    ;;

    button/volumeup*)
        amixer sset Master 5%+
    ;;

    button/lid*CLOSE*|button/screenlock*)
        su -c slock lieu &
    ;;

    button/sleep*)
        printf mem > /sys/power/state
    ;;

    video/brightnessdown*)
        bri 10 -
    ;;

    video/brightnessup*)
        bri 10 +
    ;;
esac
