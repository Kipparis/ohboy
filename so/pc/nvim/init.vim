" TODO: BufLeave on nerd tree switches on another pane
"===== Plugins ====="{{{
call plug#begin('~/.vim/plugged')

""" DEPENDENCIES Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/L9'

" vanilla Vim
" hi Pmenu ctermbg=cyan


""" PLUGINS

"colorscheme
Plug 'morhetz/gruvbox' " warn 
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'AlessandroYorba/Alduin'

" autoclosing brackets
Plug 'Raimondi/delimitMate'

" show indent
Plug 'Yggdroot/indentLine'

" align some shit by symbol
" Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'

" make buffer out of region
Plug 'chrisbra/NrrwRgn'

" arg wrap ( from raw make many lines )
Plug 'FooSoft/vim-argwrap'

Plug 'ycm-core/YouCompleteMe'

" snipets for autocomplite
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" python autocomplite
Plug 'davidhalter/jedi-vim'

" folder tree
Plug 'scrooloose/nerdtree'

" Line in bottob ( or top )
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" comment region
Plug 'tomtom/tcomment_vim'

" comand history
Plug 'wincent/command-t'

Plug 'alvan/vim-closetag'

" nav between tmux panes and vim panes
Plug 'christoomey/vim-tmux-navigator'

" autocomplet
" Plug 'ervandew/supertab'

" c complete
" Plug 'Rip-Rip/clang_complete'
" let g:clang_library_path='/usr/lib/llvm-7/lib/libclang-7.so.1'
" c c++
Plug 'majutsushi/tagbar'


Plug 'lervag/vimtex'

" folding
Plug 'tmhedberg/SimpylFold'


Plug 'plytophogy/vim-virtualenv'

" ult search engine
Plug 'kien/ctrlp.vim'

Plug 'tpope/vim-surround'

""" GIT SHIT """
" git support 
Plug 'tpope/vim-fugitive'
" git diff showing
Plug 'airblade/vim-gitgutter'
" commit viewer
Plug 'junegunn/gv.vim'
" visualize, stage, write/amend commit message
Plug 'jreybert/vimagit'


" django development
" autocomplete and snippets
Plug 'mjbrownie/vim-htmldjango_omnicomplete'

" markdown preview
" Plug 'iamcco/markdown-preview.nvim'
Plug 'JamshedVesuna/vim-markdown-preview'

" Plug 'tclem/vim-arduino'

" Plug 'iamcco/markdown-preview.nvim'
Plug 'MikeCoder/markdown-preview.vim'

" custom autocompletition
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" Fast python completion (use ncm2 if you want type info or snippet support)
Plug 'HansPinckaers/ncm2-jedi'
" Words in buffer completion
Plug 'ncm2/ncm2-bufword'
" Filepath completion
Plug 'ncm2/ncm2-path'

" Plug 'Shougo/echodoc.vim'
Plug 'gilsondev/searchtasks.vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" All of your Plugins must be added before the following line}}}
"===== General configuration ======"{{{
set noshowmode
set encoding=UTF-8
set fileformat=unix
set scrolloff=3 " keep three lines between the cursor and the edge of the screen
syntax on 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab  	" tab -> spaces
" set smartindent		"autoindent after {
set number relativenumber " show lines numbering
set wildmenu " autocomplete of vim commands
set wildmode=full
set wildignorecase
" folding -- :help folding
set foldmethod=marker
set clipboard=unnamedplus " copy to normal clipboard
set mouse=a               " make maouse more usable
" width to be move on new line
" setlocal colorcolumn=73 " than edge
setlocal textwidth=72
" not hiding symbols " :help 'conceallevel'
set conceallevel=1
" splitting on right
set splitright
" no highlighting " :help 'hlsearch'
nohlsearch
" round tabs to a multiple of 'shiftwidwth'
" set shiftround
colorscheme gruvbox
hi Normal ctermbg=NONE
" for c,c++ to allow debugging
packadd termdebug " :help terminal-debug

"}}}
"===== Generic plugins configuration ====="{{{
"===== YCM configuration ====="{{{
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_cxx_default_flags = ['-Wall', '-Wconversion', '-std=c++11']

" let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command = 'split-or-existing-window' 
let g:ycm_confirm_extra_conf = 0
"}}}
"===== SimpylFold configuration ====="{{{
" :help SimpylFold
let g:SimpylFold_docstring_preview=1 " preview docstring 
let g:SimpylFold_fold_docstring=1 " fold docstrings
let g:SimpylFold_fold_import=1 " fold imports
" Commands can be found at :help fold-commands
" }}}
"===== Nerd Tree settings ====="{{{
" autoclose when only tree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " to see available characters :digraph
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
  " autostart nerd tree when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"}}}
"===== IndentLine configuration ====="{{{
" tab show
let g:indentLine_setColors = 0
" let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " each level has own
let g:indentLine_char = '¦'
let g:indentLine_setConceal = 0 
" save conceallevel}}}
"===== Ultisnips configuration ====="{{{
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical" " vertical split to edit ft snippets

    " :help UltiSnips-authoring-snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips'] " directory to store
    " Notes: absolute path will speed up searching

    " :help UltiSnips-triggers
    " Set ultisnips triggers
    " works after restarting :/
let g:UltiSnipsExpandTrigger="<c-j>"  " set same as jump forward           
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"                                       
let g:UltiSnipsJumpBackwardTrigger="<c-k>" 
    " instead of same expand and jump
" inoremap <c-j> :call UltiSnips#ExpandSnippetOrJump<CR>

    " :help UltiSnips-visual-placeholder

"}}}
"===== Airline configuration ====="{{{
" for airline to work
let g:airline_powerline_fonts = 1
" airline theme
let g:airline_theme='minimalist'
"}}}
"===== DelimitMate configuration ====="{{{
" {} will translate on 2 new lines when *Enter* between them
let g:delimitMate_expand_cr = 2
"}}}
"===== Git configuration ====="{{{
" update time
set updatetime=100
" for vim to auto check for incom commits
set autoread
autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' |
  \ checktime | endif
" not include merge conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
"}}}
"===== DevIcons configuration ====="{{{
" :help devicons
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js']='ƛ'
" if exists("g:loaded_webdevicons")
" 	call webdevicons#refresh()
" endif

  " specify own icons that don't work as expected
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['py'] = '+'
" }}}
" }}}
"===== Specific language configs ====="{{{
"====================================="
"===== HTML development ====="{{{

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
" do not break with delimitMate <>
au FileType html,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:}"
" html auto-complete
set omnifunc=htmlcomplete#CompleteTags
" css auto-complete
set omnifunc=csscomplete#CompleteCSS
"}}}
"===== C++-family development ====="{{{
au BufNewFile,BufRead *.cpp,*.hpp
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set smartindent |
  \ set fileformat=unix
"}}}
"===== Web development ====="{{{
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2"}}}
"===== Python development ====="{{{
" autocmd FileType python setlocal foldenable foldmethod=syntax
" set foldtext=getline(v:foldstart+1)

let g:virtualenv_auto_activate = 1
" jedi-vim config
" let g:jedi#use_tabs_not_buffers = 1
" set omnifunc=jedi#completions
let g:jedi#force_py_version = '3'

augroup filetype_py
  " clear all commands in group
  autocmd!  
  autocmd FileType py 
    \ setlocal foldmethod=syntax |
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4
  " call for ncm2 matcher
  autocmd FileType py call ncm2#enable_for_buffer()
  " or
  " autocmd BufEnter * call ncm2#enable_for_buffer()
augroup END

" ncm2 settings
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 2
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "2"

" " turn off ycm
" let g:loaded_youcompleteme = 1
" let g:ycm_auto_trigger=0


"}}}
" ===== Shell development ===== {{{
augroup filetype_sh
  " clear all commands in group
  autocmd!  
  autocmd FileType zsh,bash
    \ setlocal foldmethod=marker |
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4
augroup END
" }}}
"===== Arduino development ====="{{{
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

"Default: /Applications/Arduino.app/Contents/Resources/Java
let g:vim_arduino_library_path="/usr/share/arduino/"
"Default: result of `$(ls /dev/tty.* | grep usb)`
let g:vim_arduino_serial_port="/dev/ttyACM0"
"}}}
"===== Prolog development ====="{{{
autocmd BufRead,BufNewFile *.pro set filetype=prolog
  " open terminal and run current file
map <leader>p :vsp \| terminal swipl -q %<CR>

"}}}
"===== Latex development ====="{{{
let g:tex_flavor = 'latex'
let g:vimtex_view_method='mupdf'
" do not break with delimitMate <>
" au FileType tex,latex b:delimitMate_matchpairs = "(:),[:],{:},$:$"
augroup filetype_tex
  " clear all commands in group
  autocmd!  
  autocmd FileType tex,latex
    \ setlocal foldmethod=marker |
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4
augroup END
"}}}
"===== MarkDown development ====="{{{
augroup filetype_md
  " clear all commands in group
    autocmd!  
    autocmd FileType markdown 
        \ setlocal tabstop=4 |
        \ setlocal shiftwidth=4 |
        \ setlocal softtabstop=4 |
        " tab -> spaces
        \ setlocal expandtab |
    " shortcuts for arrows
    autocmd FileType markdown inoreabbrev <buffer> -> $rarr;
    autocmd FileType markdown inoreabbrev <buffer> <- $larr;
    autocmd FileType markdown inoreabbrev <buffer> -^ $uarr;
    autocmd FileType markdown inoreabbrev <buffer> v- $rarr;
    " bold surround
    autocmd FileType markdown let b:surround_{char2nr('b')} = "**\r**"
    " italic surround
    autocmd FileType markdown let b:surround_{char2nr('i')} = "_\r_"
    " 
    " might add smiles
    " https://gist.github.com/rxaviers/7360908
    "
    " add spaces at the end
    autocmd FileType markdown nnoremap <buffer> <leader>as A<space><space><esc>

    " help UltiSnips-snippet-actions
    " very useful for snippets
augroup END
" read this 
" https://vim.works/2019/03/16/using-markdown-in-vim/
"
" make markdown autocomplete _ and __
"}}}
"===== Txt(notes) development{{{
au BufNewFile,BufRead *.txt
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set smartindent |
  \ set fileformat=unix
"}}}
"}}}
"===== Mappings ========"{{{
"======================="

let mapleader=','
let maplocalleader='.'
nnoremap <leader>ev :vsplit $MYVIMRC<cr>  " edit vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>  " source vimrc

""" Movement {{{
  " Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk
  " faster moving
nnoremap <s-l> $
nnoremap <s-h> ^
nnoremap <s-k> 30k
nnoremap <s-j> 30j
  " do not scretch your's fingers
inoremap jk <esc>
  " exit from terminal mode
tnoremap jk <C-\><C-n>
"}}}
""" Editing (writing text in process) {{{
"}}}
""" Text formatting (after writing text, make more clean) {{{
  " create new region from selected " :h NarrowRegion
vnoremap <leader>cr :NR
nnoremap <leader>wr :WR
  " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign) 
  " wrap arguments
nnoremap <leader>a :ArgWrap<CR>

  " modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>,<line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>,<line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>,<line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>,<line2>, '0336')
" }}}
""" Appearence (colors, panels on sides, folding) {{{
  " change transparent background
nnoremap <leader>nb :set background=dark<cr>
nnoremap <leader>tb :hi Normal ctermbg=NONE<cr>
  " enable folding with the spacebar
nnoremap <space> za     " open\close folding
vnoremap <leader>cf zf  " create folding
  " create tagbar on write
nmap <F8> :TagbarToggle<CR>
  " open nerd tree
map <C-t> :NERDTreeToggle<CR>
"}}}
"}}}
