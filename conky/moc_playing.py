#!/usr/bin/env python
# -*- coding: ascii -*-

import os
		
def info_read():
    info_iter = os.popen("//usr//bin//mocp -i")
    info_dict = {}
    for line in info_iter:
        n = line.index(':')
        info_dict[ line[:n] ] = line[n+2:-1]
    return info_dict

def Header(info):
    shift = " "
    if info['State'] == "PAUSE":
        shift = ""
    header = "MOC  %s ${alignr 7}${font PizzaDude Bullets:size=10}x${font} ${mixerbar}" % info['State']
    return header

def State(info):
    n = 25
    if info['State'] == "PLAY":
        state_num = 3
    elif info['State'] == "PAUSE":
        state_num = 7
    elif info['State'] == "STOP":
        n = 25
        state_num = 8
    state = "${color lightgreen}${font PizzaDude Bullets:size=20}${alignr %d}%d${font}${color}" % (n, state_num)
    return state

def Artist(info):
    artist = "${voffset 5}%s" % info['Artist']
    return artist

def Song(info):
    song = "%s" % info['SongTitle']
    return song
#print()

def TimeBar(info):
    currentsec = eval(info['CurrentSec'])
    totalsec = eval(info['TotalSec'])
    percent = 100 * currentsec / totalsec
    time = "${voffset 5}${color green}%s${color} - %s  ${alignr}${execbar echo %d}" % (info['TimeLeft'], info['TotalTime'], percent)
    return time
    
def main():
    info = info_read()
    # print(Header(info))
    if info['State'] != "STOP":
        print("%s%s" % (Artist(info),State(info)))
    else:
        print("${voffset 5}%s" % State(info))
    if info['State'] != "STOP":
        print(Song(info))
        print(TimeBar(info))
    
main()
    
    
