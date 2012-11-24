#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
This small program lists all IMAP folders on a server and prepends them with the plus sign to used by mutt

Author: Jan Christoph Ebersbach <jceb@e-jc.de>
Last Modified: Sat 27. Jun 2009 08:41:06 +0200 CEST
"""

import imaplib
import sys
from optparse import OptionParser
from ConfigParser import ConfigParser

def extractMailboxes (l):
	return [ m.split('"')[-2] for m in l ]

def createOptionParser ():
	parser = OptionParser ()
	parser.usage = "usage: %prog [options] host"
	parser.add_option ("-F", "--passwdfile", dest="passwdfile", help="Password file")
	parser.add_option ("-U", "--username", dest="username", help="Username")
	parser.add_option ("-P", "--password", dest="password", help="Password")
	parser.add_option ("-p", "--port", type='int', dest="port", help="Port (default: %default)")
	parser.add_option ("-l", dest="l", help="Leading string (default: %default)")
	parser.add_option ("--ssl", action="store_true", dest="ssl", help="Enable SSL (default: %default)")

	parser.set_defaults (host='localhost', ssl=False, username='', password='', l='+')

	return parser

if __name__ == '__main__':
	parser = createOptionParser ()

	(options, args) = parser.parse_args ()

	# finish options
	if not args:
		print >> sys.stderr, 'ERROR: No host specified.'
		parser.print_help ()
		sys.exit (1)

	imap = imaplib.IMAP4
	if options.ssl:
		imap = imaplib.IMAP4_SSL
		if not options.port:
			options.port = 993
	elif not options.port:
		options.port = 143

	if options.passwdfile:
		config = ConfigParser ()
		config.read (options.passwdfile)
		options.username = config.get ('User', 'username')
		options.password = config.get ('User', 'password')

	if not options.username:
		print >> sys.stderr, 'ERROR: No username specified.'
		parser.print_help ()
		sys.exit (1)

	# open connection
	con = imap (args[0], options.port)
	if con.login (options.username, options.password)[0] != 'OK':
		print >> sys.stderr, 'Login failed'
		sys.exit (1)
	if con.select ()[0] != 'OK':
		print >> sys.stderr, 'Select failed'
		sys.exit (1)
	if con.check ()[0] != 'OK':
		print >> sys.stderr, 'Check failed'
		sys.exit (1)
	boxes = con.list ()
	if boxes[0] != 'OK':
		print >> sys.stderr, 'Failed to retrieve mailboxes'
		sys.exit (1)
	con.close()
	con.logout()

	# print mailboxes
	mailboxes = extractMailboxes (boxes[1])
	mailboxes.sort ()
	print '"' + options.l + ('" "%s' % options.l).join (mailboxes) + '"'
