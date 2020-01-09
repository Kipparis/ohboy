" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign) 

" switching light and dark bg
" call togglebg#map("<F5>")

" Set ultisnips triggers
" works after restarting :/
let g:UltiSnipsExpandTrigger="<c-j>"  " set same as jump forward                                  
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"                                       
let g:UltiSnipsJumpBackwardTrigger="<c-k>" 



""" HOTKEYS FOR PLUGINS
nnoremap <leader>a :ArgWrap<CR>



" Nerd Tree
map <C-t> :NERDTreeToggle<CR>


" ycm mappings
" useless to mape 'go to definition' becouse jedi vim already makes this
" let g:ycm_key_invoke_completion = '<C-Space>'



" enable folding with the spacebar
nnoremap <space> za
" TODO: define mappings for next foldings
" set mapping for folding custom region
" set mapping for folding func
" set mapping for folding docstring


map <leader>p :vsp \| terminal swipl -q %<CR>

nmap <F8> :TagbarToggle<CR>

  " select word under cursor
nnoremap <space> viw

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>

  " faster moving
nnoremap <s-l> $
nnoremap <s-h> ^
nnoremap <s-k> 30k
nnoremap <s-j> 30j
  " move line downward
nnoremap <C-j> ddp
  " move line upward
nnoremap <C-k> ddkP
