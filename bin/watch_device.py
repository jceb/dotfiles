#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import sys
import time

STATSFILE = '/proc/net/dev'
RECV_BYTES = 0
TRANS_BYTES = 8

def get_stats(devices):
	lineseplen = len(os.linesep)
	stats = {}
	lines = [line[:-lineseplen] for line in open(STATSFILE).readlines()]
	for line in lines:
		l = line.split(':', 1)
		dev = l[0].strip()
		if dev in devices and len(l) == 2:
			stats[dev] = l[1].split()
			for i in xrange(0, len(stats[dev])):
				stats[dev][i] = int(stats[dev][i])

	return stats

bytes = (1, 'b')
kbytes = (1024, 'kb')
mbytes = (kbytes * 1024, 'M')
gbytes = (mbytes * 1024, 'G')
def human_readable(_bytes):
	_tmp = bytes
	if _bytes >= gbytes[0]:
		_tmp = gbytes
	elif _bytes >= mbytes[0]:
		_tmp = mbytes
	elif _bytes >= kbytes[0]:
		_tmp = kbytes
	return (_bytes/_tmp[0], _tmp[1])

def watch(devices, interval=1):
	stats_old = None
	print 'Interval is %s seconds' % interval
	print 'Interface: In Out'
	while True:
		stats = get_stats(devices)
		if stats_old:
			for dev in devices:
				dev_stats_old = stats_old.get(dev, None)
				dev_stats = stats.get(dev, None)
				if dev_stats and dev_stats_old:
					recv = human_readable(dev_stats[RECV_BYTES] - dev_stats_old[RECV_BYTES])
					trans = human_readable(dev_stats[TRANS_BYTES] - dev_stats_old[TRANS_BYTES])
					print '%s: %d%s %d%s' % (dev, recv[0], recv[1], trans[0], trans[1])
			time.sleep(interval)
		else:
			time.sleep(1)
		stats_old = stats

if __name__ == '__main__':
	try:
		watch(sys.argv[1:])
	except KeyboardInterrupt:
		pass
