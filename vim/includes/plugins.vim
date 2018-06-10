"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'https://github.com/vim-ctrlspace/vim-ctrlspace'
call plug#end()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-ctrlspace {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically save workspace
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" }}}
