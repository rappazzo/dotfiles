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

filetype plugin on         " auto-detect file type for syntax highlighting
filetype indent on         " auto-indent files when the syntax is known

" set the syntax type to 'SQL', and prettify it
map <Leader>sql :syntax enable<CR>:SQLUFormatter<CR>:set filetype=SQL<CR>

" set the syntax type to 'XML', and prettify it
map <Leader>xml :set filetype=xml<CR>:syntax enable<CR>:%!tidy -mi -xml -q -utf8 -w 1000<CR>1G=G

" set the syntax type to 'JSON', and prettify it
map <Leader>json :set filetype=json<CR>:syntax enable<CR>:%!python -m json.tool<CR>

" Disable folding in the markdown plugin
let g:vim_markdown_folding_disabled=1

" switch to tab-enabled/tab-disabled mode
map <Leader>tabs :set noexpandtab<CR>:set tabstop=8<CR>:set shiftwidth=8<CR>
map <Leader>notabs :set expandtab<CR>:set tabstop=3<CR>:set shiftwidth=3<CR>

" see: https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
set laststatus=2
"set statusline=%<\ %2*[%n%H%M%R%W]%*\ %-40f\ %=%1*%y%*%*\ %10((%l,%c)%)\ %P
"The above expanded:
"set statusline=
"set statusline+=%<\                       " cut at start
"set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
"set statusline+=%-40f\                    " path
"set statusline+=%=%1*%y%*%*\              " file type
"set statusline+=%10((%l,%c)%)\            " line and column
"set statusline+=%P                        " percentage of file
"

"set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%=%-16(\ %l,%c-%v\ %)%P
"set statusline=%<\ %1*\ [%n]\ %*%4*\ %<%F%*\ %2*%m%*%=%3*%y%*\ %5*%5l%*%1*/%2*%L%*%1*\ \ Col:\ %v\ %*
"hi User1 guifg=#ae9d00 guibg=#003541 " ctermfg=yellow
"hi User2 guifg=#ff4433 guibg=#003541 " ctermfg=red
"hi User3 guifg=#ea4692 guibg=#003541 " ctermfg=blue
"hi User4 guifg=#20e308 guibg=#003541 " ctermfg=green
"hi User5 guifg=#26abd2 guibg=#003541 " ctermfg=magenta
"hi StatusLine guifg=#ae9d00 guibg=#003541 " ctermbg=black

"no-color
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
