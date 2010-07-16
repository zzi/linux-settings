#!/bin/bash

sleep 30

conky -c $HOME/.conky/rc/conkyrc_system &
conky -c $HOME/.conky/rc/conkyrc_time_calendar &
conky -c $HOME/.conky/rc/conkyrc_mail &
conky -c $HOME/.conky/rc/conkyrc_network &
conky -c $HOME/.conky/rc/conkyrc_harddisk &
conky -c $HOME/.conky/rc/conkyrc_moc &
conky -c $HOME/.conky/rc/conkyrc_weather
