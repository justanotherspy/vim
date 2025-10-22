" ============================================================================
" Nord - Arctic-Inspired Cool Theme
" Inspired by the Nord color palette - cool blues and grays
" ============================================================================

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "nord"

" Nord Color Palette
" Polar Night: #2e3440, #3b4252, #434c5e, #4c566a
" Snow Storm: #d8dee9, #e5e9f0, #eceff4
" Frost: #8fbcbb, #88c0d0, #81a1c1, #5e81ac
" Aurora: #bf616a, #d08770, #ebcb8b, #a3be8c, #b48ead

" Editor Settings
hi Normal           guifg=#d8dee9 guibg=#2e3440 ctermfg=253 ctermbg=236
hi LineNr           guifg=#4c566a guibg=#2e3440 ctermfg=240 ctermbg=236
hi CursorLine       guibg=#3b4252 ctermbg=237 cterm=NONE
hi CursorLineNr     guifg=#81a1c1 guibg=#3b4252 ctermfg=109 ctermbg=237 cterm=bold
hi Visual           guibg=#434c5e ctermbg=238
hi Cursor           guifg=#2e3440 guibg=#d8dee9 ctermfg=236 ctermbg=253
hi CursorColumn     guibg=#3b4252 ctermbg=237

" UI Elements
hi ColorColumn      guibg=#3b4252 ctermbg=237
hi SignColumn       guifg=#4c566a guibg=#2e3440 ctermfg=240 ctermbg=236
hi Folded           guifg=#616e88 guibg=#3b4252 ctermfg=60 ctermbg=237
hi VertSplit        guifg=#434c5e guibg=#2e3440 ctermfg=238 ctermbg=236
hi StatusLine       guifg=#d8dee9 guibg=#434c5e ctermfg=253 ctermbg=238 cterm=bold
hi StatusLineNC     guifg=#616e88 guibg=#3b4252 ctermfg=60 ctermbg=237
hi Pmenu            guifg=#d8dee9 guibg=#434c5e ctermfg=253 ctermbg=238
hi PmenuSel         guifg=#2e3440 guibg=#81a1c1 ctermfg=236 ctermbg=109 cterm=bold
hi TabLine          guifg=#616e88 guibg=#3b4252 ctermfg=60 ctermbg=237
hi TabLineSel       guifg=#d8dee9 guibg=#434c5e ctermfg=253 ctermbg=238 cterm=bold

" Search & Matching
hi Search           guifg=#2e3440 guibg=#88c0d0 ctermfg=236 ctermbg=110
hi IncSearch        guifg=#2e3440 guibg=#8fbcbb ctermfg=236 ctermbg=109 cterm=bold
hi MatchParen       guifg=#8fbcbb guibg=#434c5e ctermfg=109 ctermbg=238 cterm=bold

" Messages
hi ErrorMsg         guifg=#bf616a ctermfg=131 cterm=bold
hi WarningMsg       guifg=#ebcb8b ctermfg=222 cterm=bold
hi ModeMsg          guifg=#81a1c1 ctermfg=109 cterm=bold
hi MoreMsg          guifg=#a3be8c ctermfg=144 cterm=bold

" Syntax Highlighting
hi Comment          guifg=#616e88 ctermfg=60 cterm=italic
hi Todo             guifg=#ebcb8b guibg=#3b4252 ctermfg=222 ctermbg=237 cterm=bold
hi String           guifg=#a3be8c ctermfg=144
hi Number           guifg=#b48ead ctermfg=139
hi Boolean          guifg=#b48ead ctermfg=139
hi Constant         guifg=#b48ead ctermfg=139
hi Identifier       guifg=#8fbcbb ctermfg=109
hi Function         guifg=#88c0d0 ctermfg=110 cterm=bold
hi Statement        guifg=#81a1c1 ctermfg=109 cterm=bold
hi Conditional      guifg=#81a1c1 ctermfg=109 cterm=bold
hi Repeat           guifg=#81a1c1 ctermfg=109 cterm=bold
hi Operator         guifg=#d8dee9 ctermfg=253
hi Keyword          guifg=#81a1c1 ctermfg=109 cterm=bold
hi PreProc          guifg=#5e81ac ctermfg=67
hi Type             guifg=#5e81ac ctermfg=67 cterm=bold
hi Special          guifg=#d08770 ctermfg=173
hi Delimiter        guifg=#d8dee9 ctermfg=253
hi Error            guifg=#bf616a guibg=#3b4252 ctermfg=131 ctermbg=237 cterm=bold
hi Title            guifg=#81a1c1 ctermfg=109 cterm=bold

" Diff
hi DiffAdd          guifg=#a3be8c guibg=#3b4252 ctermfg=144 ctermbg=237
hi DiffChange       guifg=#81a1c1 guibg=#3b4252 ctermfg=109 ctermbg=237
hi DiffDelete       guifg=#bf616a guibg=#3b4252 ctermfg=131 ctermbg=237
hi DiffText         guifg=#2e3440 guibg=#81a1c1 ctermfg=236 ctermbg=109 cterm=bold

" Git
hi GitGutterAdd     guifg=#a3be8c guibg=#2e3440 ctermfg=144 ctermbg=236
hi GitGutterChange  guifg=#81a1c1 guibg=#2e3440 ctermfg=109 ctermbg=236
hi GitGutterDelete  guifg=#bf616a guibg=#2e3440 ctermfg=131 ctermbg=236

" Additional
hi Directory        guifg=#81a1c1 ctermfg=109 cterm=bold
hi SpecialKey       guifg=#434c5e ctermfg=238
hi NonText          guifg=#434c5e ctermfg=238
