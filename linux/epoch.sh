#!/bin/bash

"""
Computers can interpret only 1s and 0s, making it a bit complicated to interpret
dates in terms of year, month and day. Scientists came up with a solution to help 
computers understand dates: provide the date to the computer as a numerical value
in terms of seconds and teach it to interpret that value as a human-readable date. 
This seconds value will be calculated by picking a point of reference and counting
the number of seconds elapsed since that point. This is what Epoch Time is about.
"""

"""
Who Decided the Unix Time?
In the 1960s and 1970s, Dennis Ritchie and Ken Thompson built the Unix system together.
They decided to set 00:00:00 UTC January 1, 1970, as the “epoch” moment for Unixsystems.
"""

$date
$date "+%s"                      # Epoch in seconds
$date +%s.%N                     # Epoch in seconds and nano seconds
$date --date @0                  # Thu 01 Jan 1970 02:00:00 AM EET
$date --date @1618318630         # Tue 13 Apr 2021 03:57:10 PM EEST


"""
Epoch in postgresql
"""
#Current time
select now();

#Epoch from current time;
#Epoch is number of seconds since 1970-01-01 00:00:00+00
select extract(epoch from now());                            # with mili seconds
select extract (epoch from now()::timestamp(0));             # only seconds
