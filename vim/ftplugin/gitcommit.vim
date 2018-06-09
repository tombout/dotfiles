" Disable jump to last position for git commits
augroup DisableLastPositionJump
    autocmd!
    autocmd BufWinEnter <buffer> execute 'normal! gg0'
augroup END
