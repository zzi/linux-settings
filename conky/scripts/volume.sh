#!/bin/bash

# Get current volume.
get_volume()
{
    mixer=$(amixer get Master | grep 'Front Left:')
    echo $mixer | cut -d ' ' -f 4
}

# Set volume.
set_volume()
{
    amixer cset iface=MIXER,name="Master Playback Volume" $1 >/dev/null
}

get_volume()
