#!/usr/bin/env python2

# vcardquery.py -- vcard query program
# @Author       : Unknown
# @Modifications: Jan Christoph Ebersbach (jceb@tzi.de)
# @License      : GPL (see http://www.gnu.org/licenses/gpl.txt)
# @Created      : 2006-12-24
# @Last Modified: Sat 09. Apr 2011 11:46:26 +0200 CEST
# @Revision     : 0.0
# @vi           : ft=python:tw=80:sw=4:ts=8
#
# @Description  :
# @Usage        :
# @TODO         :
# @CHANGES      :

###############################################
# answer vcard queries from kabc file
###############################################
import datetime
import getopt
import os
import re
import sys

KDE_ADDRESSBOOKS=(os.environ['HOME'] + '/.kde/share/apps/kabc/std.vcf')

ADR_HOME_INIT_STRING = r'ADR;[^:]*TYPE=HOME[^:]*:'
# String to identify Mail address entrys in vcards
MAIL_PREF_INIT_STRING = r'EMAIL;TYPE=PREF:'
MAIL_INIT_STRING = r'EMAIL(;TYPE=[^P:][^:;]*)*:'
# String to identify Name entrys in vcards
NAME_INIT_STRING = r'N:'
# String to identify Birthday entrys in vcards
BDAY_INIT_STRING = r'BDAY:'
# String to identify Category entrys in vcards
CATEGORY_INIT_STRING = r'CATEGORIES:'

class vcard:
	def __init__(self):
		self.email = ''
		self.name = ''
		self.bday = ''
		self.fields = ["email", "name"]
		self.__delimiter = " "
		self.__printFormat = None

	def __str__(self):
		output = []
		for field in self.fields:
			if hasattr(self, field):
				output.append(getattr(self, field))

		if self.__printFormat != None:
			return self.__printFormat % tuple(output)
		else:
			return self.__delimiter.join(output)

	def setDelimiter(self, delimiter):
		if delimiter != None and type(delimiter) in (str, unicode):
			self.__delimiter = delimiter

	def setPrintFields(self, fields):
		if fields != None and len(fields) > 0:
			# clear fields
			self.fields = []
			for field in fields:
				if hasattr(self, field):
					self.fields.append(field)

	def setPrintFormat(self, f):
		if f == None or (type(f) in (str, unicode) and len(f) > 0):
			self.__printFormat = f

def parseFile(filenames):
	vcards = []
	if type(filenames) in (list, tuple):
		for filename in filenames:
			if not os.access(filename, os.F_OK|os.R_OK):
				print 'Cannot open file ' , filename
				continue
			# sys.exit(1)
			try:
				cf = open(filename)
				cards = cf.read()
			finally:
				cf.close()
			re_vcard = re.compile(r'BEGIN:VCARD.*?END:VCARD', re.DOTALL)
			vcards += re_vcard.findall(cards)

	return vcards

def getAllEmailAddresses(vcards, ignored):
	lines = []
	mail_pref_re = re.compile(r'^' + MAIL_PREF_INIT_STRING + r'(.*)$', re.MULTILINE)
	mail_re = re.compile(r'^' + MAIL_INIT_STRING + r'(.*)$', re.MULTILINE)
	name_re = re.compile(r'^' + NAME_INIT_STRING + r'(.*)$', re.MULTILINE)
	for loop_vcard in vcards:
		if name_re.search(loop_vcard) != None:
			tmp_name = name_re.search(
					loop_vcard).group(1).split(";")
			tmp_name = ("%s %s" % (tmp_name[1], tmp_name[0])).strip()
		else:
			tmp_name = ''

		if mail_pref_re.search(loop_vcard) != None:
			tmp_pref_mail = mail_pref_re.search(loop_vcard)
			my_vcard = vcard()
			my_vcard.email = tmp_pref_mail.group(1).strip()
			my_vcard.name = tmp_name
			my_vcard.setPrintFields(("name", "email"))
			my_vcard.setPrintFormat('"%s" <%s>')

			lines.append(my_vcard)

		if mail_re.search(loop_vcard) != None:
			tmp_mails = mail_re.findall(loop_vcard)
			if tmp_mails:
				for tmp_mail in tmp_mails:
					if type(tmp_mail) in  (list, tuple):
						tmp_mail = tmp_mail[-1]
					my_vcard = vcard()
					my_vcard.email = tmp_mail.strip()
					my_vcard.name = tmp_name
					my_vcard.setPrintFields(("name", "email"))
					my_vcard.setPrintFormat('"%s" <%s>')

					lines.append(my_vcard)

	return lines

def getAllBirthdays(vcards, ignored):
	lines = []
	bday_re = re.compile(r'^' + BDAY_INIT_STRING + r'([0-9]{4}-[0-9]{2}-[0-9]{2}).*$', re.MULTILINE)
	name_re = re.compile(r'^' + NAME_INIT_STRING + r'(.*)$', re.MULTILINE)
	for loop_vcard in vcards:
		if bday_re.search(loop_vcard) != None:
			if name_re.search(loop_vcard) != None:
				tmp_name = name_re.search(
						loop_vcard).group(1).split(";")
				tmp_name = ("%s %s" % (tmp_name[1], tmp_name[0])).strip()
			else:
				tmp_name = ''

			bday_match = bday_re.search(loop_vcard)
			tmp_bday = bday_match.group(1).split("-")
			bday = datetime.date(int(tmp_bday[0]), int(tmp_bday[1]), int(tmp_bday[2]))
			myVcard = vcard()
			myVcard.name = tmp_name
			myVcard.bday =  "%s (%s)" % (bday.isoformat(), (bday.today().year - bday.year))
			myVcard.setPrintFields(("bday", 'name'))
			myVcard.setDelimiter("\t")

			lines.append(myVcard)
	return lines

def getBirthdayMatches(vcards, search_date):
	lines = []
	bday_re = re.compile(r'^' + BDAY_INIT_STRING + "([0-9]{4}-" + str(search_date.month).zfill(2) + "-" + str(search_date.day).zfill(2) + ')' + r'(.*)$', re.MULTILINE)
	name_re = re.compile(r'^' + NAME_INIT_STRING + r'(.*)$', re.MULTILINE)
	for loop_vcard in vcards:
		if bday_re.search(loop_vcard) != None:
			if name_re.search(loop_vcard) != None:
				tmp_name = name_re.search(
						loop_vcard).group(1).split(";")
				tmp_name = ("%s %s" % (tmp_name[1], tmp_name[0])).strip()
			else:
				tmp_name = ''

			tmp_year = bday_re.search(loop_vcard).group(1)[:4]
			birthday = datetime.date(int(tmp_year), search_date.month, search_date.day)

			myVcard = vcard()
			myVcard.name = tmp_name
			myVcard.bday =  "%s (%s)" % (birthday.isoformat(), (birthday.today().year - birthday.year))
			myVcard.setPrintFields(("bday", 'name'))
			myVcard.setDelimiter("\t")

			lines.append(myVcard)
	return lines

def getCategoryMatches(vcards, search_string, printVcards=False):
	lines = []
	search_re = re.compile(search_string, re.I)
	category_re = re.compile(r'^' + CATEGORY_INIT_STRING + r'(.*)$', re.MULTILINE)
	name_re = re.compile(r'^' + NAME_INIT_STRING + r'(.*)$', re.MULTILINE)
	for loop_vcard in vcards:
		if search_re.search(loop_vcard):
			if name_re.search(loop_vcard) != None:
				tmp_name = name_re.search(loop_vcard).group(1).split(";")
				tmp_name = ("%s %s" % (tmp_name[1], tmp_name[0])).strip()
			else:
				tmp_name = ''

			if category_re.search(loop_vcard) != None:
				tmp_mails = category_re.findall(loop_vcard)
				tmp_categories = category_re.search(loop_vcard).group(1).split("\\,")
				tmp_categories = [ item.strip().lower() for item in tmp_categories ]
				if search_string.lower() in tmp_categories:
					if printVcards:
						lines.append('')
						loop_vcard = re.sub(re.compile('^' + CATEGORY_INIT_STRING + '.*$', re.MULTILINE), CATEGORY_INIT_STRING + search_string, loop_vcard)
						lines.append(loop_vcard)
					else:
						my_vcard = vcard()
						my_vcard.name = tmp_name
						lines.append(my_vcard)

	return lines

def getMailMatches(vcards, search_string, muttoutput):
	lines = []
	search_re = re.compile(search_string, re.I)
	mail_pref_re = re.compile(r'^' + MAIL_PREF_INIT_STRING + r'(.*)$', re.MULTILINE)
	mail_re = re.compile(r'^' + MAIL_INIT_STRING + r'(.*)$', re.MULTILINE)
	name_re = re.compile(r'^' + NAME_INIT_STRING + r'(.*)$', re.MULTILINE)
	for loop_vcard in vcards:
		if search_re.search(loop_vcard):
			if name_re.search(loop_vcard) != None:
				tmp_name = name_re.search(
						loop_vcard).group(1).split(";")
				tmp_name = ("%s %s" % (tmp_name[1], tmp_name[0])).strip()
			else:
				tmp_name = ''

			if mail_pref_re.search(loop_vcard) != None:
				tmp_pref_mail = mail_pref_re.search(loop_vcard)
				my_vcard = vcard()
				my_vcard.email = tmp_pref_mail.group(1).strip()
				my_vcard.name = tmp_name
				if muttoutput:
					my_vcard.setPrintFields(("email", "name"))
					my_vcard.setDelimiter("\t")
				else:
					my_vcard.setPrintFields(("name", "email"))
					my_vcard.setPrintFormat('%s <%s>')

				lines.append(my_vcard)

			if mail_re.search(loop_vcard) != None:
				tmp_mails = mail_re.findall(loop_vcard)
				if tmp_mails:
					for tmp_mail in tmp_mails:
						if type(tmp_mail) in  (list, tuple):
							tmp_mail = tmp_mail[-1]
						my_vcard = vcard()
						my_vcard.email = tmp_mail.strip()
						my_vcard.name = tmp_name
						if muttoutput:
							my_vcard.setPrintFields(("email", "name"))
							my_vcard.setDelimiter("\t")
						else:
							my_vcard.setPrintFields(("name", "email"))
							my_vcard.setPrintFormat('%s <%s>')

						lines.append(my_vcard)

	if muttoutput:
		lines = ['Searched ' + str(len(vcards)) + ' vcards, found ' +
				str(len(lines))+ ' matches.'] + lines
	return lines

def getAddress(vcards, search_string, muttoutput):
	lines = []
	search_re = re.compile(search_string, re.I)
	adr_pref_re = re.compile(r'^' + ADR_HOME_INIT_STRING + r'(.*)$', re.MULTILINE | re.I)
	mail_re = re.compile(r'^' + MAIL_INIT_STRING + r'(.*)$', re.MULTILINE | re.I)
	name_re = re.compile(r'^' + NAME_INIT_STRING + r'(.*)$', re.MULTILINE | re.I)
	for loop_vcard in vcards:
		if search_re.search(loop_vcard):
			tmp_name = ''
			tmp_firstname = ''
			if name_re.search(loop_vcard) != None:
				tmp_name = name_re.search(loop_vcard).group(1).split(";")
				tmp_firstname = tmp_name[1].strip()
				tmp_name = tmp_name[0].strip()

			if adr_pref_re.search(loop_vcard) != None:
				tmp_addr = adr_pref_re.search(loop_vcard)
				my_vcard = vcard()
				tmp_addr = tmp_addr.group(1).strip().split(';')
				my_vcard.name = tmp_name
				my_vcard.firstname = tmp_firstname
				my_vcard.street = tmp_addr[2]
				my_vcard.zip = tmp_addr[5]
				my_vcard.city = tmp_addr[3]
				my_vcard.setPrintFields(("name", "firstname", "street", 'zip', 'city'))
				my_vcard.setPrintFormat('%s\t%s\t%s\t%s\t%s')

				lines.append(my_vcard)

	return lines


def usage():
	"""
	usage information
	"""
	print "\t-f|--file FILE"
	print "\t-b|--birthday BIRTHDATE in yyyy-mm-dd/mm-dd format"
	print "\t-a|--address name"
	print "\t-e|--email (name|email)"
	print "\t-v|--vcardsbycategory CATEGORY"
	print "\t-c|--category CATEGORY"
	print "\t--mutt_query QUERY"
	print "\t--allbirthdays"
	print "\t--allemailaddresses"
	sys.exit(1)

# main program starts here
if __name__ == '__main__':
	try:
		optlist, args = getopt.getopt(sys.argv[1:], "a:c:b:e:v:f:", ["allemailaddresses", "allbirthdays", "category=", 'vcardsbycategory=', 'address=', "birthday=", "email=", "mutt_query=", "file"])
	except getopt.GetoptError:
		usage()

	queryFunction = None
	args = None
	for o, a in optlist:
		if o in ("-b", "--birthday"):
			queryFunction = getBirthdayMatches
			tmp_date = a.split('-')
			if (len(tmp_date) == 3):
				date = datetime.date(int(tmp_date[0]), int(tmp_date[1]), int(tmp_date[2]))
				args = (date, )
			elif (len(tmp_date) == 2):
				date = datetime.date(1900, int(tmp_date[0]), int(tmp_date[1]))
				args = (date, )
			else:
				usage()
		elif o in ("-a", "--address"):
			queryFunction = getAddress
			args = (a, None)
		elif o in ("-e", "--email"):
			queryFunction = getMailMatches
			args = (a, None)
		elif o in ('-v', "--vcardsbycategory"):
			queryFunction = getCategoryMatches
			args = (a, True)
		elif o in ("-c", "--category", ):
			queryFunction = getCategoryMatches
			args = (a, )
		elif o in ("--mutt_query", ):
			queryFunction = getMailMatches
			args = (a, True)
		elif o in ("--allbirthdays", ):
			queryFunction = getAllBirthdays
			args = (None, )
		elif o in ("--allemailaddresses", ):
			queryFunction = getAllEmailAddresses
			args = (None, )
		elif o in ("-f", "--file"):
			KDE_ADDRESSBOOKS = (os.path.expanduser(os.path.expandvars(a)), )
		else:
			usage()

	lines = []
	if (queryFunction != None and args != None):
		vcards = parseFile(KDE_ADDRESSBOOKS)

		lines = queryFunction(vcards, *args)

		for line in lines:
			print line

	if len(lines) > 0:
		sys.exit(0)
	else:
		sys.exit(1)
