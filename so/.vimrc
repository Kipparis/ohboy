set nocompatible              " be iMproved, required
filetype off                  " required


set encoding=UTF-8
" l 0 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""" DEPENDENCIES
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-scripts/L9'

" vanilla Vim
" hi Pmenu ctermbg=cyan


""" PLUGINS

"colorscheme
Plugin 'morhetz/gruvbox' " warn
Plugin 'tlhr/anderson.vim'

" transparent background 
Plugin 'miyakogi/seiya.vim'

" autoclosing brackets
Plugin 'Raimondi/delimitMate'

" show indent
Plugin 'Yggdroot/indentLine'

" align some shit by symbol
" Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign) 


" make buffer out of region
Plugin 'chrisbra/NrrwRgn'

" arg wrap ( from raw make many lines )
Plugin 'FooSoft/vim-argwrap'

" snipets for autocomplite
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" python autocomplite
Plugin 'davidhalter/jedi-vim'

" folder tree
Plugin 'scrooloose/nerdtree'

" Line in bottob ( or top )
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" comment region
Plugin 'tomtom/tcomment_vim'

" comand history
Plugin 'wincent/command-t'

" html auto-complete
set omnifunc=htmlcomplete#CompleteTags
Plugin 'alvan/vim-closetag'

" css auto-complete
set omnifunc=csscomplete#CompleteCSS

" nav between tmux panes and vim panes
Plugin 'christoomey/vim-tmux-navigator'

" autocomplet
Plugin 'ervandew/supertab'

" c complete
Plugin 'Rip-Rip/clang_complete'
let g:clang_library_path='/usr/lib/llvm-7/lib/libclang-7.so.1'

" auto show suggestions
" Plugin 'tonybyrne/AutoComplPop' " weak
" Plugin 'rdolgushin/snipMate-acp'
Plugin 'dirkwallenstein/vim-autocomplpop'
" let g:acp_colorForward='#ffffff'
" let g:acp_colorReverse="#000000"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"


" show vim autocomple
set wildmenu
set wildmode=full
set wildignorecase

" better search
" Plugin 'easymotion/vim-easymotion'

" show arguments for function in bottom
" Plugin 'Shougo/echodoc.vim'

"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" coloring
set term=screen-256color  

colorscheme gruvbox
set background=dark

"""" tab settings
"
" number of spaaces per tab
set tabstop=4
set expandtab "convert tab into spaces
set shiftwidth=4 "tab = 4 spaces

set autoindent		"copy current indent on new lline
set smartindent		"autoindent after {

" {} will translate on 2 new lines when *Enter* between them
let g:delimitMate_expand_cr = 2

set number      "show lines numbering

""" HOTKEYS FOR PLUGINS
nnoremap <F3> :ArgWrap<CR>

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
" map <F2> : NERDTreeFocus<CR> 
" autoclose when only tree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" set guifont=Hack\ Regular:h11

" l 0

" for airline to work
let g:airline_powerline_fonts = 1
" airline theme
let g:airline_theme='minimalist'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = ' '
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_sep = ' '
let g:airline_symbols.linenr = '|'
let g:airline_symbols.linenr = '|'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = 'ѱ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = 'p'
let g:airline_symbols.whitespace = 'Ξ'


""" HTML AUTOCOMPLETE
" filenames like *.xml, *.html, *.xhtml, ...
" " These are the file extensions where this plugin is enabled.
" "
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
"
" " filenames like *.xml, *.xhtml, ...
" " This will make the list of non-closing tags self-closing in the specified
" files.
" "
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
"
" " filetypes like xml, html, xhtml, ...
" " These are the file types where this plugin is enabled.
" "
let g:closetag_filetypes = 'html,xhtml,phtml'
"
" " filetypes like xml, xhtml, ...
" " This will make the list of non-closing tags self-closing in the specified
" files.
" "
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
"
" " integer value [0|1]
" " This will make the list of non-closing tags case-sensitive (e.g. `<Link>`
" will be closed while `<link>` won't.)
" "
let g:closetag_emptyTags_caseSensitive = 1
"
 " dict
 " Disables auto-close if not in a "valid" region (based on filetype)
" "
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

"             " Shortcut for closing tags, default is '>'
"             "
let g:closetag_shortcut = '>'
"
"             " Add > at current position without closing the current tag,
"             default is ''
"             "
let g:closetag_close_shortcut = '<leader>>'

" do not break with delimitMate
au FileType html,htmldjango let b:delimitMate_matchpairs = "(:),[:],{:}"


let g:clang_library_path = '/usr/lib/'


" set cmdheight=2 " for echodoc


" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" Transparent background on startup
" autocmd VimEnter * SeiyaEnable"


syntax on
