"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
        if &paste
                return 'PASTE MODE  '
        endif
        return ''
endfunction

function! CmdLine(str)
        call feedkeys(":" . a:str)
endfunction

function! GitBranch()
        return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
        let l:branchname = GitBranch()
        return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => HTML entities
" From http://vim.wikia.com/wiki/HTML_entities
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Escape/unescape & < > HTML entities in range (default current line).
function! HtmlEntities(line1, line2, action)
        let search = @/
        let range = 'silent ' . a:line1 . ',' . a:line2
        if a:action == 0  " must convert &amp; last
                execute range . 'sno/&lt;/</eg'
                execute range . 'sno/&gt;/>/eg'
                execute range . 'sno/&amp;/&/eg'
        else              " must convert & first
                execute range . 'sno/&/&amp;/eg'
                execute range . 'sno/</&lt;/eg'
                execute range . 'sno/>/&gt;/eg'
        endif
        nohl
        let @/ = search
endfunction

if !exists(":Entities")
        command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
endif

noremap <silent> <Leader>h :Entities 0<CR>
noremap <silent> <Leader>H :Entities 1<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Delete trailing white spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CleanExtraSpaces()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        silent! %s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction

if !exists(":CleanExtraSpaces")
        command! CleanExtraSpaces call CleanExtraSpaces()
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
        command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                                \ | wincmd p | diffthis
endif

if !exists(":Buffer")
        " Command :Buffer to switch buffer by choosing it from buffer list
        command -nargs=? -bang Buffer
                                \ if <q-args> != '' | exe 'buffer '.<q-args> | else | ls<bang> |
                                        \   let buffer_nn=input('Which one: ') | if buffer_nn != '' | exe buffer_nn != 0 ? 'buffer '.buffer_nn : 'enew' | endif |
                                        \ endif
endif

