#!/bin/sh

tar=$(ip -br a | awk '{print $1}' | grep -v "lo\|docker0")
echo "%{F#00BFFF}%{F#FFFFFF}$(/usr/sbin/ifconfig $tar | grep "inet " | awk '{print $2}')%{u-}"

