" python development
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" in your plugin constants configuration section
let g:virtualenv_auto_activate = 1

" jedi-vim config
" let g:jedi#use_tabs_not_buffers = 1

" set omnifunc=jedi#completions
let g:jedi#force_py_version = '3'

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
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

" turn off ycm
let g:loaded_youcompleteme = 1
let g:ycm_auto_trigger=0

" " additional color highlight
" " highlight attribute access: hello.highlighted
" autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
" " highlight function calls: hello.highlighted()
" autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
" hi def link pythonFunction Function
" " Highlight self slightly darker
" autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
" highlight self ctermfg=239
" " Extra Impsort highlights:
" hi pythonImportedObject ctermfg=127
" hi pythonImportedFuncDef ctermfg=127
" hi pythonImportedClassDef ctermfg=127
