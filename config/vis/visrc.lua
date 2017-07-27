-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/filetype')
require('plugins/textobject-lexer')

vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme papercolor')
	vis:command('set change-256colors false')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set number')
	vis:command('set relativenumbers')
	vis:command('set autoindent')
	vis:command('set colorcolumn 80')
	vis:command('set show-tabs')
	vis:command('set cursorline')
	vis:command('set tabwidth 4')
end)

