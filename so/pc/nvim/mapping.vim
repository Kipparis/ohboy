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
"

map <leader>cc :!ino build -d /usr/share/arduino10 -m leonardo<CR>
map <leader>uu :!ino upload -d /usr/share/arduino10 -m leonardo -p /dev/ttyACM0<CR>
map <leader>ss :!ino serial -p /dev/ttyACM0<CR>
" map <leader>cc :!ino build -d /usr/share/arduino10<CR>
" map <leader>uu :!ino upload -d /usr/share/arduino10<CR>

map <leader>p :vsp \| terminal swipl -q %<CR>

nmap <F8> :TagbarToggle<CR>
