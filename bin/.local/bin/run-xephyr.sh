#!/usr/bin/env bash
if test $# -ge 1; then
	Xephyr -screen 1024x768 -ac -noreset $*
else
	#Xephyr -screen 1398x1033 -ac -noreset :9
	Xephyr -screen 1024x768 -ac -noreset :9
fi
