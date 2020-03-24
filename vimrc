"make it easy, please"

set nocompatible
syntax enable

""""""""""""""""""""""""""""""""
"	PLUG
""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'romainl/vim-cool'
Plug 'kristijanhusak/vim-hybrid-material'

call plug#end()

""""""""""""""""""""""""""""""""
"	GENERAL
""""""""""""""""""""""""""""""""
set encoding=utf-8
"set mouse=a						"active the mouse support
set backspace=indent,eol,start
set history=500					"remember the last X unique commands
set undolevels=500				"undo up to X commands
" set laststatus=2
" set ttyfast
" set nowrap
" set smarttab

""""""""""""""""""""""""""""""""
"	COLORS
""""""""""""""""""""""""""""""""
set background=dark				"only way to go
"let g:despacio_Midnight = 1	"despacio stuff (background dark gray)
let g:enable_bold_font = 1		"hybrid_material stuff
let g:airline_theme='simple'
colorscheme hybrid_material		"angr, jellybeans, despacio, hybrid_material

""""""""""""""""""""""""""""""""
"	SPACES AND TABS
""""""""""""""""""""""""""""""""
set tabstop=4					"number of visual spaces per TAB
set softtabstop=4				"number of spaces in tab when editing
"set expandtab					"tabs are space		// do not
set autoindent					"repeat indentation on new line
"set smartindent					"auto indent after keywords

"ts = tabstop / sw = shiftwidth / sts = softtabstop
augroup filetypeTab
	au FileType c,cpp setlocal ts=4 sw=4 tw=80
	au Filetype python,xml,octave,java,text,tex setlocal expandtab ts=4 sw=4 sts=4
	au Filetype python setlocal tw=79
	au Filetype tex setlocal tw=80 directory=.
	au Filetype htmldjango,pov setlocal ts=4 sw=4 sts=4
	au Filetype html,javascript,yml,toml,vim,json,ruby,eruby,arduino,bib,help setlocal expandtab ts=2 sw=2 sts=2
	"au Filetype html,javascript,vim,json,help setlocal ts=4 sw=4 sts=4
augroup END


""""""""""""""""""""""""""""""""
"	UI CONFIG
""""""""""""""""""""""""""""""""
set number						"show line numbers
set showcmd						"show command in bottom bar
set cursorline					"highlight current line
set wildmenu					"visual autocomplete for command menu
set lazyredraw					"redraw only when we need to
set showmatch					"highlight matching [{()}]
set ruler						"show cursor line and column
" set cmdheight=2				"command has 2 lines

""""""""""""""""""""""""""""""""
"	SEARCH
""""""""""""""""""""""""""""""""
set incsearch					"search as characters are entered
set hlsearch					"highlight matches
set ignorecase					"ignore case during search

""""""""""""""""""""""""""""""""
"	FOLDING
""""""""""""""""""""""""""""""""
set foldenable					"enable folding
set foldlevelstart=10			"open most folds by default

""""""""""""""""""""""""""""""""
"	MOVEMENT
""""""""""""""""""""""""""""""""
nnoremap j gj					"if there's a very long line that gets visually wrapper to two lines
nnoremap k gk					"j and k won't skip over the "fake" part of the visual line

nnoremap B ^					"move to beginning of line
nnoremap E $					"move to end of line

"$ and ^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" nnoremap gV `[v`]

""""""""""""""""""""""""""""""""
"	MAP
""""""""""""""""""""""""""""""""
map <Space> <Leader>

" select all
nmap <Leader>a ggVG

map f w

" save, quit, quit all
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>W :w !sudo tee %> /dev/null<CR>
nnoremap <Leader>q :q<CR>
nnoremap Q :q!<CR>
"nnoremap <Leader>Q :qa!<CR>
