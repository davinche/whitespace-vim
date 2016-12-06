if exists('g:whitespace_plugin')
    finish
endif
let g:whitespace_plugin = 1

" -----------------------------------------------------------------------------
" Default Variables -----------------------------------------------------------
" -----------------------------------------------------------------------------
if !exists('g:highlight_whitespace')
    let g:highlight_whitespace = 1
endif
if !exists('g:strip_whitespace_on_save')
    let g:strip_whitespace_on_save = 1
endif
highlight ExtraWhiteSpace ctermbg = red guibg = #FF0000

" -----------------------------------------------------------------------------
" Highlight and Strip Functions -----------------------------------------------
" -----------------------------------------------------------------------------
function! s:DisableHighlight()
    match ExtraWhiteSpace ''
    match none
endfunction

function! s:EnableHighlight()
    match ExtraWhiteSpace ''
    match ExtraWhiteSpace /\s\+$/
endfunction

function! s:StripWhiteSpace(line1, line2)
    let s = @/
    let l = line(".")
    let c = col(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//e'
    let @/ = s
    call cursor(l, c)
endfunction

function s:ToggleHighlightWhiteSpace()
    if b:highlight_whitespace == 1
        let b:highlight_whitespace = 0
        let msg = 'OFF'
        call s:DisableHighlight()
    else
        let msg = 'ON'
        let b:highlight_whitespace = 1
        call s:EnableHighlight()
    endif
    echo 'WhiteSpace Highlight [' . msg . ']'
endfunction

function s:ToggleStripWhitespaceOnSave()
    if b:strip_whitespace_on_save == 1
        let b:strip_whitespace_on_save = 0
        let msg = 'OFF'
    else
        let b:strip_whitespace_on_save = 1
        let msg = 'ON'
    endif
    call s:Setup()
    echo 'StripWhiteSpaceOnSave [' . msg . ']'
endfunction

function s:HighlightOtherLines()
    let currline = line('.')
    execute 'match ExtraWhiteSpace /\v' .
        \ '%<' . currline . 'l\s+$|' .
        \ '%>' . currline . 'l\s+$/'
endfunction

function! s:Setup()
    if !exists('b:strip_whitespace_on_save')
        let b:strip_whitespace_on_save = g:strip_whitespace_on_save
    endif

    if !exists('b:highlight_whitespace')
        let b:highlight_whitespace = g:highlight_whitespace
    endif

    if b:highlight_whitespace == 1
        call s:EnableHighlight()
    endif

    augroup HighlightOnEdit
        autocmd!
        if b:highlight_whitespace == 1
            autocmd InsertEnter,CursorMovedI * call s:HighlightOtherLines()
        endif
    augroup END

    augroup StripOnSave
        autocmd!
        if b:strip_whitespace_on_save == 1
            autocmd BufWritePre * call s:StripWhiteSpace(0, line('$'))
        endif
    augroup END
endfunction
autocmd WinEnter,BufWinEnter * call s:Setup()

" Setup Commands --------------------------------------------------------------
command ToggleHighlightWhiteSpace call s:ToggleHighlightWhiteSpace()
command ToggleStripWhitespaceOnSave call s:ToggleStripWhitespaceOnSave()
