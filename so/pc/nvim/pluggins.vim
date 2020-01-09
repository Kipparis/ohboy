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
