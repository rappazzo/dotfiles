"Disable the fullscreen toggle touchbar icon
let g:macvim_default_touchbar_fullscreen=0

set ic                     " Ignore Case
set nowrap                 " Don't wrap lines 
set clipboard=unnamed      " Use the system clipboard
set directory=~/.vim/temp  " Write temp files (for all edits) here
set expandtab              " use spaces instead of tabs on a tab key press
set tabstop=3              " Indent width
set shiftwidth=3           " Indent width
set nobackup               " do not keep a backup file, use versions instead
set hlsearch               " Highlight searches
" personal preference
set background=light
colorscheme solarized
set number
set showtabline=2          " always show the tab bar
set tabpagemax=25          " the max number of tabs.  Exceeding this will split-open

filetype plugin on         " auto-detect file type for syntax highlighting
filetype indent on         " auto-indent files when the syntax is known

" Auto syntax formatting
map <Leader>json :set filetype=json<CR>:syntax enable<CR>:%!python3 -m json.tool<CR>
map <Leader>sql :set filetype=SQL<CR>:syntax enable<CR>:SQLUFormatter<CR>
map <Leader>xml :set filetype=xml<CR>:syntax enable<CR>:%!tidy -mi -xml -q -utf8 -w 1000<CR>1G=G

" **** Touchbar settings ****
" See https://github.com/macvim-dev/macvim/blob/master/runtime/doc/gui_mac.txt
anoremenu 1.1 TouchBar.-space- <Nop>
tlnoremenu 1.1 TouchBar.-space- <Nop>
an TouchBar.format.JSON :set filetype=json<CR>:syntax enable<CR>:%!python3 -m json.tool<CR>
an TouchBar.format.XML :set filetype=xml<CR>:syntax enable<CR>:%!tidy -mi -xml -q -utf8 -w 1000<CR>1G=G
an TouchBar.format.SQL :set filetype=SQL<CR>:syntax enable<CR>:SQLUFormatter<CR>

an icon=NSTouchBarAddTabTemplate TouchBar.NewTab :tabnew<CR>

" Disable folding in the markdown plugin
let g:vim_markdown_folding_disabled=1

" switch to tab-enabled/tab-disabled mode
map <Leader>tabs :set noexpandtab<CR>:set tabstop=8<CR>:set shiftwidth=8<CR>
map <Leader>notabs :set expandtab<CR>:set tabstop=3<CR>:set shiftwidth=3<CR>

" see: https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
set laststatus=2
set statusline=%<\ \ [%n]\ %*\ %<%F%*\ %m%*%=%y%*\ %5l%*/%L%*\ \ Col:\ %v\ %*
"The above expanded:
"set statusline=
"set statusline +=%1*\ [%n]\ %*          "buffer number
"set statusline +=%4*\ %<%F%*\           "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%=                     "left / right separator
"set statusline +=%3*%y%*\               "file type
"set statusline +=%5*%5l%*               "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*\ \ Col:%v\ %*      "column number

noremap <2-LeftMouse> *
