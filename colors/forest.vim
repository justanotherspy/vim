" ============================================================================
" Forest - Nature-Inspired Green Theme
" A calming theme inspired by deep forests and nature
" ============================================================================

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "forest"

" Color Palette
" Forest: #1a2421, #243230, #2d403a
" Green: #7fb069, #5d8f5a, #4a7547
" Sage: #c4d8b5, #a8c69f
" Earth: #8b7355, #a0826d
" Moss: #99c24d, #82a844

" Editor Settings
hi Normal           guifg=#c4d8b5 guibg=#1a2421 ctermfg=187 ctermbg=232
hi LineNr           guifg=#5d8f5a guibg=#1a2421 ctermfg=71 ctermbg=232
hi CursorLine       guibg=#243230 ctermbg=233 cterm=NONE
hi CursorLineNr     guifg=#7fb069 guibg=#243230 ctermfg=107 ctermbg=233 cterm=bold
hi Visual           guibg=#2d403a ctermbg=235
hi Cursor           guifg=#1a2421 guibg=#c4d8b5 ctermfg=232 ctermbg=187
hi CursorColumn     guibg=#243230 ctermbg=233

" UI Elements
hi ColorColumn      guibg=#243230 ctermbg=233
hi SignColumn       guifg=#5d8f5a guibg=#1a2421 ctermfg=71 ctermbg=232
hi Folded           guifg=#a8c69f guibg=#243230 ctermfg=150 ctermbg=233
hi VertSplit        guifg=#2d403a guibg=#1a2421 ctermfg=235 ctermbg=232
hi StatusLine       guifg=#c4d8b5 guibg=#2d403a ctermfg=187 ctermbg=235 cterm=bold
hi StatusLineNC     guifg=#a8c69f guibg=#243230 ctermfg=150 ctermbg=233
hi Pmenu            guifg=#c4d8b5 guibg=#2d403a ctermfg=187 ctermbg=235
hi PmenuSel         guifg=#1a2421 guibg=#7fb069 ctermfg=232 ctermbg=107 cterm=bold
hi TabLine          guifg=#a8c69f guibg=#243230 ctermfg=150 ctermbg=233
hi TabLineSel       guifg=#c4d8b5 guibg=#2d403a ctermfg=187 ctermbg=235 cterm=bold

" Search & Matching
hi Search           guifg=#1a2421 guibg=#99c24d ctermfg=232 ctermbg=149
hi IncSearch        guifg=#1a2421 guibg=#7fb069 ctermfg=232 ctermbg=107 cterm=bold
hi MatchParen       guifg=#99c24d guibg=#2d403a ctermfg=149 ctermbg=235 cterm=bold

" Messages
hi ErrorMsg         guifg=#e07856 ctermfg=173 cterm=bold
hi WarningMsg       guifg=#d4a574 ctermfg=180 cterm=bold
hi ModeMsg          guifg=#7fb069 ctermfg=107 cterm=bold
hi MoreMsg          guifg=#99c24d ctermfg=149 cterm=bold

" Syntax Highlighting
hi Comment          guifg=#5d8f5a ctermfg=71 cterm=italic
hi Todo             guifg=#d4a574 guibg=#243230 ctermfg=180 ctermbg=233 cterm=bold
hi String           guifg=#a8c69f ctermfg=150
hi Number           guifg=#82a844 ctermfg=107
hi Boolean          guifg=#82a844 ctermfg=107
hi Constant         guifg=#82a844 ctermfg=107
hi Identifier       guifg=#a0826d ctermfg=138
hi Function         guifg=#7fb069 ctermfg=107 cterm=bold
hi Statement        guifg=#99c24d ctermfg=149 cterm=bold
hi Conditional      guifg=#99c24d ctermfg=149 cterm=bold
hi Repeat           guifg=#99c24d ctermfg=149 cterm=bold
hi Operator         guifg=#c4d8b5 ctermfg=187
hi Keyword          guifg=#99c24d ctermfg=149 cterm=bold
hi PreProc          guifg=#7fb069 ctermfg=107
hi Type             guifg=#7fb069 ctermfg=107 cterm=bold
hi Special          guifg=#d4a574 ctermfg=180
hi Delimiter        guifg=#c4d8b5 ctermfg=187
hi Error            guifg=#e07856 guibg=#243230 ctermfg=173 ctermbg=233 cterm=bold
hi Title            guifg=#7fb069 ctermfg=107 cterm=bold

" Diff
hi DiffAdd          guifg=#99c24d guibg=#243230 ctermfg=149 ctermbg=233
hi DiffChange       guifg=#7fb069 guibg=#243230 ctermfg=107 ctermbg=233
hi DiffDelete       guifg=#e07856 guibg=#243230 ctermfg=173 ctermbg=233
hi DiffText         guifg=#1a2421 guibg=#7fb069 ctermfg=232 ctermbg=107 cterm=bold

" Git
hi GitGutterAdd     guifg=#99c24d guibg=#1a2421 ctermfg=149 ctermbg=232
hi GitGutterChange  guifg=#7fb069 guibg=#1a2421 ctermfg=107 ctermbg=232
hi GitGutterDelete  guifg=#e07856 guibg=#1a2421 ctermfg=173 ctermbg=232

" Additional
hi Directory        guifg=#7fb069 ctermfg=107 cterm=bold
hi SpecialKey       guifg=#2d403a ctermfg=235
hi NonText          guifg=#2d403a ctermfg=235
