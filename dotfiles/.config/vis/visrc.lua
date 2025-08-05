-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/filetype')
require('plugins/textobject-lexer')
require('plugins/surround/surround')
require('plugins/commentary/vis-commentary')
-- requires editorconfig_core which I haven't come around to configuring yet
-- require('plugins/editorconfig/editorconfig')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
	vis:command('set theme papercolor')
	vis:command('set change-256colors on')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- Your per window configuration options e.g.
	vis:command('set numbers')
	vis:command('set relativenumbers')
	vis:command('set autoindent')
	vis:command('set colorcolumn 80')
	vis:command('set show-tabs')
	vis:command('set cursorline')
	vis:command('set tabwidth 4')
end)
