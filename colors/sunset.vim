" ============================================================================
" Sunset - Warm Orange and Red Theme
" Inspired by beautiful sunsets and warm colors
" ============================================================================

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "sunset"

" Color Palette
" Evening: #1a1410, #2a2018, #3a2820
" Orange: #ff9b54, #e88854, #d97547
" Red: #e74c3c, #c0392b
" Yellow: #f39c12, #f1c40f
" Pink: #ff6b9d, #e84393

" Editor Settings
hi Normal           guifg=#f5e6d3 guibg=#1a1410 ctermfg=223 ctermbg=232
hi LineNr           guifg=#a67c52 guibg=#1a1410 ctermfg=137 ctermbg=232
hi CursorLine       guibg=#2a2018 ctermbg=233 cterm=NONE
hi CursorLineNr     guifg=#ff9b54 guibg=#2a2018 ctermfg=215 ctermbg=233 cterm=bold
hi Visual           guibg=#3a2820 ctermbg=235
hi Cursor           guifg=#1a1410 guibg=#f5e6d3 ctermfg=232 ctermbg=223
hi CursorColumn     guibg=#2a2018 ctermbg=233

" UI Elements
hi ColorColumn      guibg=#2a2018 ctermbg=233
hi SignColumn       guifg=#a67c52 guibg=#1a1410 ctermfg=137 ctermbg=232
hi Folded           guifg=#c89b6c guibg=#2a2018 ctermfg=180 ctermbg=233
hi VertSplit        guifg=#3a2820 guibg=#1a1410 ctermfg=235 ctermbg=232
hi StatusLine       guifg=#f5e6d3 guibg=#3a2820 ctermfg=223 ctermbg=235 cterm=bold
hi StatusLineNC     guifg=#c89b6c guibg=#2a2018 ctermfg=180 ctermbg=233
hi Pmenu            guifg=#f5e6d3 guibg=#3a2820 ctermfg=223 ctermbg=235
hi PmenuSel         guifg=#1a1410 guibg=#ff9b54 ctermfg=232 ctermbg=215 cterm=bold
hi TabLine          guifg=#c89b6c guibg=#2a2018 ctermfg=180 ctermbg=233
hi TabLineSel       guifg=#f5e6d3 guibg=#3a2820 ctermfg=223 ctermbg=235 cterm=bold

" Search & Matching
hi Search           guifg=#1a1410 guibg=#f39c12 ctermfg=232 ctermbg=214
hi IncSearch        guifg=#1a1410 guibg=#ff9b54 ctermfg=232 ctermbg=215 cterm=bold
hi MatchParen       guifg=#f1c40f guibg=#3a2820 ctermfg=220 ctermbg=235 cterm=bold

" Messages
hi ErrorMsg         guifg=#e74c3c ctermfg=203 cterm=bold
hi WarningMsg       guifg=#f39c12 ctermfg=214 cterm=bold
hi ModeMsg          guifg=#ff9b54 ctermfg=215 cterm=bold
hi MoreMsg          guifg=#f1c40f ctermfg=220 cterm=bold

" Syntax Highlighting
hi Comment          guifg=#a67c52 ctermfg=137 cterm=italic
hi Todo             guifg=#f39c12 guibg=#2a2018 ctermfg=214 ctermbg=233 cterm=bold
hi String           guifg=#ffbe76 ctermfg=222
hi Number           guifg=#ff9b54 ctermfg=215
hi Boolean          guifg=#ff9b54 ctermfg=215
hi Constant         guifg=#ff9b54 ctermfg=215
hi Identifier       guifg=#ff6b9d ctermfg=204
hi Function         guifg=#ff9b54 ctermfg=215 cterm=bold
hi Statement        guifg=#e74c3c ctermfg=203 cterm=bold
hi Conditional      guifg=#e74c3c ctermfg=203 cterm=bold
hi Repeat           guifg=#e74c3c ctermfg=203 cterm=bold
hi Operator         guifg=#f5e6d3 ctermfg=223
hi Keyword          guifg=#e74c3c ctermfg=203 cterm=bold
hi PreProc          guifg=#f39c12 ctermfg=214
hi Type             guifg=#f39c12 ctermfg=214 cterm=bold
hi Special          guifg=#ff6b9d ctermfg=204
hi Delimiter        guifg=#f5e6d3 ctermfg=223
hi Error            guifg=#e74c3c guibg=#2a2018 ctermfg=203 ctermbg=233 cterm=bold
hi Title            guifg=#ff9b54 ctermfg=215 cterm=bold

" Diff
hi DiffAdd          guifg=#82b366 guibg=#2a2018 ctermfg=107 ctermbg=233
hi DiffChange       guifg=#f39c12 guibg=#2a2018 ctermfg=214 ctermbg=233
hi DiffDelete       guifg=#e74c3c guibg=#2a2018 ctermfg=203 ctermbg=233
hi DiffText         guifg=#1a1410 guibg=#f39c12 ctermfg=232 ctermbg=214 cterm=bold

" Git
hi GitGutterAdd     guifg=#82b366 guibg=#1a1410 ctermfg=107 ctermbg=232
hi GitGutterChange  guifg=#f39c12 guibg=#1a1410 ctermfg=214 ctermbg=232
hi GitGutterDelete  guifg=#e74c3c guibg=#1a1410 ctermfg=203 ctermbg=232

" Additional
hi Directory        guifg=#ff9b54 ctermfg=215 cterm=bold
hi SpecialKey       guifg=#3a2820 ctermfg=235
hi NonText          guifg=#3a2820 ctermfg=235
