set nocompatible              " be iMproved, required
filetype off                  " required


set noshowmode
set encoding=UTF-8
set scrolloff=3 " keep three lines between the cursor and the edge of the screen
" l 0 
" set the runtime path to include Vundle and initialize

call plug#begin('~/.vim/plugged')

source ~/.config/nvim/pluggins.vim

call plug#end()



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
" set foldmethod=indent " folding by indent
" set foldlevel=99
set foldmethod=marker
" autocmd FileType python setlocal foldenable foldmethod=syntax
set foldtext=getline(v:foldstart+1)


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
au BufNewFile,BufRead *.cpp,*.hpp
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix


" web development
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2



" ycm config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command = 'split-or-existing-window' 
let g:ycm_confirm_extra_conf = 0


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

set splitright
source ~/.config/nvim/mapping.vim



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

" let g:ycm_cxx_default_flags = ['-Wall', '-Wconversion', '-std=c++14']
let g:ycm_cxx_default_flags = ['-Wall', '-Wconversion', '-std=c++11']

autocmd BufRead,BufNewFile *.pro set filetype=prolog

set mouse=a

"Default: /Applications/Arduino.app/Contents/Resources/Java
let g:vim_arduino_library_path="/usr/share/arduino/"
"Default: result of `$(ls /dev/tty.* | grep usb)`
let g:vim_arduino_serial_port="/dev/ttyACM0"

au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" let g:mkdp_browser = 'chromium'
" let g:mkdp_path_chrome = \"firefox\"

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

