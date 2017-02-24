-- PaperColor codes Copyright (c) 2016 Nguyen Nguyen <NLKNguyen@MSN.com>
local lexers = vis.lexers

local colors = {
	['foreground']  = '#444444',
	['background'] = '#f5f5f5',

	['red'] = '#df0000', -- Include/Exception
	['green'] = '#008700', -- Boolean/Special
	['blue'] = '#4271ae', -- Keyword

	['pink'] = '#d7005f', -- Type
	['olive'] = '#718c00', -- String
	['navy'] = '#005f87', -- StorageClass

	['orange'] = '#d75f00', -- Number
	['purple'] = '#8959a8', -- Repeat/Conditional
	['aqua'] = '#3e999f', -- Operator/Delimiter

	['magenta'] = '#d33682',
	['violet'] = '#6c71c4',
	['cyan'] = '#2aa198',

	['selection'] = '#bcbcbc',
	['base02'] = '#073642',
	['comment'] = '#878787',

	['cursorline'] = '#e4e4e4',
	['cursorbackground'] = '#87afd7',
	['cursorforeground'] = '#f5f5f5',
}

lexers.colors = colors
-- light
local fg = ',fore:'..colors.foreground..','
local bg = ',back:'..colors.background..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = 'fore:'..colors.navy
lexers.STYLE_COMMENT = 'fore:'..colors.comment
lexers.STYLE_CONSTANT = 'fore:'..colors.orange
lexers.STYLE_DEFINITION = 'fore:'..colors.blue
lexers.STYLE_ERROR = 'fore:'..colors.red..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.blue
lexers.STYLE_KEYWORD = 'fore:'..colors.navy..',bold'
lexers.STYLE_LABEL = 'fore:'..colors.blue
lexers.STYLE_NUMBER = 'fore:'..colors.orange
lexers.STYLE_OPERATOR = 'fore:'..colors.aqua
lexers.STYLE_REGEX = 'fore:'..colors.aqua
lexers.STYLE_STRING = 'fore:'..colors.olive
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.red
lexers.STYLE_TAG = 'fore:'..colors.green
lexers.STYLE_TYPE = 'fore:'..colors.pink..',bold'
lexers.STYLE_VARIABLE = 'fore:'..colors.blue
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = 'fore:'..colors.blue
lexers.STYLE_IDENTIFIER = fg

lexers.STYLE_LINENUMBER = 'fore:'..colors.selection
lexers.STYLE_CURSOR = 'fore:'..colors.cursorforeground..',back:'..colors.cursorbackground
lexers.STYLE_CURSOR_LINE = 'back:'..colors.cursorline
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.cursorline
-- lexers.STYLE_SELECTION = 'back:'..colors.base02
lexers.STYLE_SELECTION = 'back:'..colors.selection
