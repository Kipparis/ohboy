set nocompatible              " be iMproved, required
filetype off                  " required


set encoding=utf-8
" l 0 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()



source ~/.config/nvim/pluggins.vim




" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" html auto-complete
set omnifunc=htmlcomplete#CompleteTags

" css auto-complete
set omnifunc=csscomplete#CompleteCSS

let g:tex_flavor = 'latex'
let g:vimtex_view_method='mupdf'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required




" coloring
" set term=screen-256color  

" set termguicolors
colorscheme gruvbox
" set background=dark

" let g:alduin_Shout_Become_Ethereal = 1
" colorscheme alduin

"""" tab settings
"
" number of spaaces per tab
set tabstop=2
set expandtab "convert tab into spaces
set shiftwidth=2 "tab = 4 spaces

" set autoindent		"copy current indent on new lline
set smartindent		"autoindent after {

set number relativenumber " show lines numbering

" show vim autocomple
set wildmenu
set wildmode=full
set wildignorecase


" folding
set foldmethod=indent " folding by indent
set foldlevel=99

" copy to normal clipboard
" set clipboard=unnamed


setlocal colorcolumn=73
setlocal textwidth=72


" {} will translate on 2 new lines when *Enter* between them
let g:delimitMate_expand_cr = 2


" autoclose when only tree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" l 0 
" for airline to work
let g:airline_powerline_fonts = 1
" airline theme
let g:airline_theme='minimalist'

""" HTML AUTOCOMPLETE
" filenames like *.xml, *.html, *.xhtml, ...
" " These are the file extensions where this plugin is enabled.
" "
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx' 
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }

" do not break with delimitMate
au FileType html,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:}"


" python development
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix

" Use the below highlight group when displaying bad whitespace is desired.
" TODO: fix it
highlight BadWhitespace ctermbg=red guibg=red
" showing bad whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" TODO: autoactivate venv
let g:jedi#auto_initialization=1
let g:jedi#auto_vim_configuration=1

" in your plugin constants configuration section
let g:virtualenv_auto_activate = 1

set omnifunc=jedi#completions
let g:jedi#force_py_version = '3'

" web development
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2



" ycm config
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command = 'split-or-existing-window' 


" jedi-vim config
let g:jedi#use_tabs_not_buffers = 1

" preview docstring
let g:SimpylFold_docstring_preview=1

" not hiding symbols
set conceallevel=1

" indentLine
" tab show
let g:indentLine_setColors = 0
" let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " each level has own
let g:indentLine_char = '¦'
let g:indentLine_setConceal = 0 " save conceallevel



syntax on

source ~/.config/nvim/mapping.vim


" test shit
" autocmd FileType python setlocal foldenable foldmethod=syntax
set foldtext=getline(v:foldstart+1)

" GIT
" more faster update
set updatetime=100

" for vim to auto check for incom commits
set autoread
autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' |
  \ checktime | endif
" not include merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" no highlighting
nohlsearch
" to set highlighting 
" set hlsearch
" fast toggle of highlighting 
" :noremap <F4> :set hlsearch! hlsearch?<CR>

" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

au BufRead,BufNewFile *.pro set filetype=prolog

