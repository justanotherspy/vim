" ============================================================================
" Synthwave - Retro 80s Neon Theme
" Inspired by synthwave aesthetics with vibrant purples and pinks
" ============================================================================

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "synthwave"

" Synthwave Color Palette
" Dark: #0d0221, #190534, #2b124c
" Purple: #7209b7, #560bad, #480ca8
" Pink: #ff006e, #fb5607, #ff99c8
" Cyan: #00f5ff, #00d9ff, #00bbf9
" Yellow: #ffbe0b, #ffd60a

" Editor Settings
hi Normal           guifg=#f0e6ff guibg=#0d0221 ctermfg=225 ctermbg=232
hi LineNr           guifg=#560bad guibg=#0d0221 ctermfg=55 ctermbg=232
hi CursorLine       guibg=#190534 ctermbg=233 cterm=NONE
hi CursorLineNr     guifg=#ff006e guibg=#190534 ctermfg=198 ctermbg=233 cterm=bold
hi Visual           guibg=#2b124c ctermbg=235
hi Cursor           guifg=#0d0221 guibg=#f0e6ff ctermfg=232 ctermbg=225
hi CursorColumn     guibg=#190534 ctermbg=233

" UI Elements
hi ColorColumn      guibg=#190534 ctermbg=233
hi SignColumn       guifg=#560bad guibg=#0d0221 ctermfg=55 ctermbg=232
hi Folded           guifg=#7209b7 guibg=#190534 ctermfg=92 ctermbg=233
hi VertSplit        guifg=#2b124c guibg=#0d0221 ctermfg=235 ctermbg=232
hi StatusLine       guifg=#f0e6ff guibg=#2b124c ctermfg=225 ctermbg=235 cterm=bold
hi StatusLineNC     guifg=#7209b7 guibg=#190534 ctermfg=92 ctermbg=233
hi Pmenu            guifg=#f0e6ff guibg=#2b124c ctermfg=225 ctermbg=235
hi PmenuSel         guifg=#0d0221 guibg=#ff006e ctermfg=232 ctermbg=198 cterm=bold
hi TabLine          guifg=#7209b7 guibg=#190534 ctermfg=92 ctermbg=233
hi TabLineSel       guifg=#f0e6ff guibg=#2b124c ctermfg=225 ctermbg=235 cterm=bold

" Search & Matching
hi Search           guifg=#0d0221 guibg=#00f5ff ctermfg=232 ctermbg=51
hi IncSearch        guifg=#0d0221 guibg=#ff006e ctermfg=232 ctermbg=198 cterm=bold
hi MatchParen       guifg=#00f5ff guibg=#2b124c ctermfg=51 ctermbg=235 cterm=bold

" Messages
hi ErrorMsg         guifg=#ff006e ctermfg=198 cterm=bold
hi WarningMsg       guifg=#ffbe0b ctermfg=220 cterm=bold
hi ModeMsg          guifg=#00f5ff ctermfg=51 cterm=bold
hi MoreMsg          guifg=#ff99c8 ctermfg=218 cterm=bold

" Syntax Highlighting
hi Comment          guifg=#7209b7 ctermfg=92 cterm=italic
hi Todo             guifg=#ffbe0b guibg=#190534 ctermfg=220 ctermbg=233 cterm=bold
hi String           guifg=#ff99c8 ctermfg=218
hi Number           guifg=#ffd60a ctermfg=220
hi Boolean          guifg=#ffd60a ctermfg=220
hi Constant         guifg=#ffd60a ctermfg=220
hi Identifier       guifg=#00f5ff ctermfg=51
hi Function         guifg=#00d9ff ctermfg=45 cterm=bold
hi Statement        guifg=#ff006e ctermfg=198 cterm=bold
hi Conditional      guifg=#ff006e ctermfg=198 cterm=bold
hi Repeat           guifg=#ff006e ctermfg=198 cterm=bold
hi Operator         guifg=#f0e6ff ctermfg=225
hi Keyword          guifg=#ff006e ctermfg=198 cterm=bold
hi PreProc          guifg=#7209b7 ctermfg=92
hi Type             guifg=#480ca8 ctermfg=55 cterm=bold
hi Special          guifg=#fb5607 ctermfg=202
hi Delimiter        guifg=#f0e6ff ctermfg=225
hi Error            guifg=#ff006e guibg=#190534 ctermfg=198 ctermbg=233 cterm=bold
hi Title            guifg=#ff006e ctermfg=198 cterm=bold

" Diff
hi DiffAdd          guifg=#00f5ff guibg=#190534 ctermfg=51 ctermbg=233
hi DiffChange       guifg=#00bbf9 guibg=#190534 ctermfg=39 ctermbg=233
hi DiffDelete       guifg=#ff006e guibg=#190534 ctermfg=198 ctermbg=233
hi DiffText         guifg=#0d0221 guibg=#00d9ff ctermfg=232 ctermbg=45 cterm=bold

" Git
hi GitGutterAdd     guifg=#00f5ff guibg=#0d0221 ctermfg=51 ctermbg=232
hi GitGutterChange  guifg=#00bbf9 guibg=#0d0221 ctermfg=39 ctermbg=232
hi GitGutterDelete  guifg=#ff006e guibg=#0d0221 ctermfg=198 ctermbg=232

" Additional
hi Directory        guifg=#00f5ff ctermfg=51 cterm=bold
hi SpecialKey       guifg=#2b124c ctermfg=235
hi NonText          guifg=#2b124c ctermfg=235
