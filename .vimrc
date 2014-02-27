set ic                     " Ignore Case
set nowrap                 " Don't wrap lines 
set clipboard=unnamed      " Use the system clipboard
set directory=~/.vim/temp  " Write temp files (for all edits) here
set expandtab              " use spaces instead of tabs on a tab key press
set tabstop=3              " Indent width
set shiftwidth=3           " Indent width
set nobackup               " do not keep a backup file, use versions instead
set hlsearch               " Highlight searches
colorscheme morning        " personal preference
filetype plugin on         " auto-detect file type for syntax highlighting
filetype indent on         " auto-indent files when the syntax is known

" set the syntax type to 'SQL', and prettify it
map <Leader>sql :syntax enable<CR>:SQLUFormatter<CR>:set filetype=SQL<CR>

" set the syntax type to 'XML', and prettify it
map <Leader>xml :set filetype=xml<CR>:syntax enable<CR>:%!tidy -mi -xml -q -utf8 -w 1000<CR>1G=G

" set the syntax type to 'JSON', and prettify it
map <Leader>json :set filetype=json<CR>:syntax enable<CR>:%!python -m json.tool<CR>

noremap <2-LeftMouse> *
