" Vim color file
" Maintainer:	Gergely Kontra <kgergely@mcl.hu>
" Last Change:	2002. 04. 09.

" I'm a bit red-blind, so if you have suggestions, don't hesitate :)
"           ^^^^^^^^^ Sorry, I cannot speak English well, just want to say,
"           that in some rare cases I cannot distinguish between some colors
"           (I've just realized it, when I see some special tests)

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "scite"

" hardcoded colors :

" GUI
"highlight Normal	guifg=#7F6F5F	guibg=#eeeeee
highlight Normal	guifg=#665E56	guibg=#ffffff
highlight Search	guifg=#82762B	guibg=#FCF5CA
highlight Visual	guifg=#695F4D	guibg=#F5D69D
highlight Folded	guifg=#ffffff	guibg=#666666
highlight Cursor	guifg=#1b1b1b	guibg=#666666	gui=bold
highlight Special	guifg=#7F007F	guibg=#eeeeff	gui=bold
highlight Structure	guifg=#CA6FDC	gui=bold
highlight Include	guifg=#4980A5	gui=bold
highlight Comment	guifg=#007F00	guibg=#F5F7F5
highlight StatusLine	guifg=#000000	guibg=#aacccc
highlight StatusLineNC	guifg=#557777	guibg=#ffffff
highlight Statement	guifg=#007F7F			gui=bold
highlight Type		guifg=#365EA7   gui=NONE
highlight Function	guifg=#007F7F	gui=bold
highlight LineNr	guifg=#999999	guibg=#e0e0e0
highlight FoldColumn	guifg=#999999	guibg=#eaeaea
highlight Define	guifg=#00007F	guibg=#ddddff gui=bold
highlight Number	guifg=#000000	guibg=#eeffff gui=bold
highlight Subtitle	guifg=#000000	guibg=#66bbbb gui=bold,underline
highlight String	guifg=#7F007F	guibg=#ffdddd
highlight Delimiter	guifg=#1b1b1b	guibg=#fefefe	gui=NONE
highlight PreProc	guifg=#0000ff	guibg=#ffffff	gui=bold
highlight Constant	guifg=#666666	guibg=#eeeeee gui=underline,bold
highlight StatusLine guifg=#ffffff guibg=#665e56 gui=NONE
highlight StatusLineNC guifg=#e0e0e0
highlight NonText guifg=#1b1b1b guibg=#f9f9f9 gui=NONE

"{{{

"}}}


