#!/usr/bin/env python

import os, time, calendar

FORMATBEGIN = "${color orange}"
FORMATEND = "${color}"


def getMonthDaysFormatted():
    today = int(time.strftime("%d"))

    cal = calendar.Calendar(calendar.MONDAY)
    month = cal.monthdayscalendar(int(time.strftime("%Y")), int(time.strftime("%m")))

    for weekID in xrange(len(month)):
        for dayID in xrange(7):
    
            if month[weekID][dayID] == 0:
                month[weekID][dayID] = "  "
    
            elif month[weekID][dayID] == today:
                month[weekID][dayID] = "%s% 2s%s" % (FORMATBEGIN, month[weekID][dayID], FORMATEND)
    
            else:
                month[weekID][dayID] = "% 2s" % month[weekID][dayID]
    
        month[weekID] = " ".join(month[weekID])
    return "\n$alignc ".join(month)


def getCalendarHeader():
    header = ""    
    
    monthYear = "%s  %s" % (time.strftime("%B"), time.strftime("%Y"))
    side = " "*((20-len(monthYear))/2)
    monthYear = "%s%s%s" % (side, monthYear, side)
    if len(monthYear) < 20:
        monthYear = "%s " % monthYear
    
    weekHeader = "$alignc Mo Tu We Th Fr Sa Su"
    
    header = "%s\n%s\n" % (monthYear, weekHeader)
    return header


def getFormattedCalendar():
    header = "$alignc "+getCalendarHeader()
    weeks = "$alignc "+getMonthDaysFormatted()
    return "%s%s" % (header, weeks)

print(getFormattedCalendar())
