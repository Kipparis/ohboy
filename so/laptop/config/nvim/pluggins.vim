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
Plugin 'yorickpeterse/happy_hacking.vim'
Plugin 'AlessandroYorba/Alduin'

" autoclosing brackets
Plugin 'Raimondi/delimitMate'

" show indent
Plugin 'Yggdroot/indentLine'

" align some shit by symbol
" Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-easy-align'

" make buffer out of region
Plugin 'chrisbra/NrrwRgn'

" arg wrap ( from raw make many lines )
Plugin 'FooSoft/vim-argwrap'

Plugin 'ycm-core/YouCompleteMe'

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

Plugin 'alvan/vim-closetag'

" nav between tmux panes and vim panes
Plugin 'christoomey/vim-tmux-navigator'

" autocomplet
" Plugin 'ervandew/supertab'

" c complete
" Plugin 'Rip-Rip/clang_complete'
" let g:clang_library_path='/usr/lib/llvm-7/lib/libclang-7.so.1'


Plugin 'lervag/vimtex'

" folding
Plugin 'tmhedberg/SimpylFold'


Plugin 'plytophogy/vim-virtualenv'

" ult search engine
Plugin 'kien/ctrlp.vim'


""" GIT SHIT """
" git support 
Plugin 'tpope/vim-fugitive'
" git diff showing
Plugin 'airblade/vim-gitgutter'
" commit viewer
Plugin 'junegunn/gv.vim'
" visualize, stage, write/amend commit message
Plugin 'jreybert/vimagit'


" django development
" autocomplete and snippets
Plugin 'mjbrownie/vim-htmldjango_omnicomplete'

" markdown preview
" Plugin 'iamcco/markdown-preview.nvim'
Plugin 'JamshedVesuna/vim-markdown-preview'
