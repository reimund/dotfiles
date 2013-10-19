" Reimund Trost's _vimrc 
"
" reimund@code7.se
"
" .vimrc : Vim configuration file
"


" My Stuff {{{
" ===========

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" Misc appearance settings
" ------------------------
syntax on           " Enable syntax highlighting.
color paintbox      " Set color scheme.
set enc=utf-8       " Encode files in UTF-8.
set cursorline      " Show the line cursor.
set number          " Show line numbers.
set guioptions-=m   " Hide the menubar.
set guioptions-=T   " Hide the toolbar
set guioptions+=b   " Shoset lines=40 columns=100w the horizontal scrollbar.
set nowrap          " Disable text wrap.
set ruler           " Show the cursor position all the time.
set hlsearch        " Highlight all search results.
"set guifont=Envy\ Code\ R:h14
set guifont=Menlo:h12

if has('mac')
	set lines=120 columns=240
endif

" Alias ConnorKrammer's vim-bufferclose.
:command D Kwbd

" Add CSS syntax highlighting to files with the .less extension.
au BufRead,BufNewFile *.less setfiletype css

" Add xml syntax highlighting to files with the .mxi extension.
au BufRead,BufNewFile *.mxi setfiletype xml


" Indentation settings
" --------------------
set autoindent      " Always set autoindenting on.
set tabstop=4       " Set tab size to 4.
set noexpandtab     " Make sure tabs are not expanded to spaces.
set softtabstop=0   " Make sure soft tabs are disabled.
set shiftwidth=4    " Let (auto)indent use 4 spaces.
filetype plugin on  " Enable filetype-specific plugins (Used by Align.vba).


" Show filename in status line.
set laststatus=2


" Buftabs settings
" ----------------
"let g:buftabs_only_basename=1
"let g:buftabs_in_statusline=1
"let g:buftabs_active_highlight_group="Visual"
noremap <C-h> :bprev<CR> 
noremap <C-l> :bnext<CR> 


" Behind the scenes stuff
" -----------------------
set backup                    " Put backup files (~[filename]) in C:\Temp rather
set backupdir=/tmp            "   than in the local directory
set directory=/tmp            "   and swap files as well.
set history=50                " Keep 50 lines of command line history.
set showcmd                   " Display incomplete commands.
set incsearch                 " Do incremental searching.
set clipboard=unnamed         " Make yanks put stuff on the OS clipboard.
set ignorecase                " Annoying when searching,
set smartcase                 "   enable smart case instead.

set fileformat=unix           " Get pretty line endings.
set fileformats=unix,dos,mac  " Detect fileformat.

language C                     " Use default language (english...).

" Key mappings
" ------------

" Fly.
map <M-Space> :ls<CR>:b<space>

map <S-RIGHT> :bn<CR>
map <S-LEFT> :bp<CR>

" Map F11 to open this configuration file.
map <F11> :e ~/_vimrc<CR>

" Map F12 to source this configuration file.
map <F12> :source ~/_vimrc<CR>

" Move line Up / Down with Cmd+j / Cmd+k.
nnoremap <D-j> mz:m+<CR>`z==
nnoremap <D-k> mz:m-2<CR>`z==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vnoremap <D-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Set the , to be leader.
let mapleader = ","

" Map toggle comment (requires NERD Commenter).
map <leader>c<space> <plug>NERDCommenterComment
map <leader>cc <plug>NERDCommenterToggle
"let NERDComLineToggleMap=',cc'


" Functions
" ------------

" Snippet from http://mo.morsi.org/blog/taxonomy/term/31:
" Generate random number at end of current line 
function! s:Rand(max)
y a         
redir @b    
ruby << EOF
  rmax = VIM::evaluate("a:max")
  rmax = nil if rmax == ""
  printf rand(rmax).to_s
EOF
redir END 
let @a = strpart(@a, 0, strlen(@a) - 1)
let @b = strpart(@b, 1, strlen(@b) - 1)
let @c = @a . @b

" At end of the line:
".s/.*/\=@c/g

" At cursor:
normal "bp

endfunction
command! -nargs=? Rand :call <SID>Rand(<q-args>)
nmap <F6> :Rand <CR>
nmap <F7> :Rand 100<CR>
nmap <F8> :Rand 100000<CR>


" }}} End My Stuff
" ================

