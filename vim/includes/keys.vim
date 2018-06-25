"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set timeoutlen=1000

" Map <Space> to : (open command-line mode) 
nnoremap <space> :

nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Replace capital W with w
cnoreabbrev W w
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Handle windows {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <tab> <c-w>w
nnoremap <c-down> <c-w>j
nnoremap <c-up> <c-w>k
nnoremap <c-left> <c-w>h
nnoremap <c-right> <c-w>l
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Handle buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>bl :Buffer!<CR>
nnoremap <Leader>bb :bprevious<CR>
nnoremap <Leader>bn :bNext<CR>
nnoremap <Leader>bc :bdelete<CR>
nnoremap <Leader>l :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Handle tabs {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

" Toggle line numbers on and off
nnoremap <Leader>pn :setlocal number!<cr>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" lhs comments
map ,# :s/^/#/<CR>:nohlsearch<CR>
map ,/ :s/^/\/\//<CR>:nohlsearch<CR>
map ,> :s/^/> /<CR>:nohlsearch<CR>
map ," :s/^/\"/<CR>:nohlsearch<CR>
map ,% :s/^/%/<CR>:nohlsearch<CR>
map ,! :s/^/!/<CR>:nohlsearch<CR>
map ,; :s/^/;/<CR>:nohlsearch<CR>
map ,- :s/^/--/<CR>:nohlsearch<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>:nohlsearch<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>:nohlsearch<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR>
" }}}
