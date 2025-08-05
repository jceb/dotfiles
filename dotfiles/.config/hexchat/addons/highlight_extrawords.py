# highlight_extrawords.py
#  Highlight extrawords with punctuation
#
# Depends: HexChat
#
# Copyright (C) 2013 Jan Christoph Ebersbach
#
# http://www.e-jc.de/
#
# All rights reserved.
#
# The source code of this program is made available
# under the terms of the GNU Affero General Public License version 3
# (GNU AGPL V3) as published by the Free Software Foundation.
#
# Binary versions of this program provided by Univention to you as
# well as other copyrighted, protected or trademarked materials like
# Logos, graphics, fonts, specific documentations and configurations,
# cryptographic keys etc. are subject to a license agreement between
# you and Univention and not subject to the GNU AGPL V3.
#
# In the case you use this program under the terms of the GNU AGPL V3,
# the program is provided in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public
# License with the Debian GNU/Linux or Univention distribution in file
# /usr/share/common-licenses/AGPL-3; if not, see
# <http://www.gnu.org/licenses/>.

# Usage:
# 0. copy plugin into HexChat directory: ~/.config/hexchat/addons/
# 1. fire up HexChat
# 2. store the words you want to highlight comma-separated in a variable:
# /py exec import hexchat; hexchat.set_pluginpref('highlight_extrawords', 'service:,all:,...')
# 3. reload plugin
# /reload highlight_extrawords.py
# 4. done

__module_name__ = "highlight_extrawords"
__module_version__ = "0.1"
__module_description__ = "Highlight extra words with punctuation"

import hexchat
extrawords = hexchat.get_pluginpref('highlight_extrawords')
if extrawords:
    extrawords = [ w.strip() for w in extrawords.split(',') ]
else:
    extrawords = []

def highlight(words, word_eol, userdata):
    """Highlight words in extra words
    """
    if words:
        for word in words[1].split():
            if word.strip().lower() in extrawords:
                hexchat.command('TRAY -b "%s" "%s"' % (words[0], words[1]))
                return

hexchat.hook_print('Channel Message', highlight)
