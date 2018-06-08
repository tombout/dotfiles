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
Plug 'https://github.com/altercation/vim-colors-solarized'
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
" => vim-colors-solarized {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:solarized_termcolors=16
" }}}
