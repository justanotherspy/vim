" ============================================================================
" Oceanic - Deep Blue Ocean Theme
" A calming theme inspired by the depths of the ocean
" ============================================================================

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "oceanic"

" Color Palette
" Deep Ocean: #0d1117, #161b22, #21262d
" Ocean Blue: #58a6ff, #388bfd, #1f6feb
" Aqua: #56d4dd, #39c5cf
" Sea Green: #3fb950, #2ea043
" Coral: #ff7b72, #f85149

" Editor Settings
hi Normal           guifg=#c9d1d9 guibg=#0d1117 ctermfg=252 ctermbg=232
hi LineNr           guifg=#6e7681 guibg=#0d1117 ctermfg=242 ctermbg=232
hi CursorLine       guibg=#161b22 ctermbg=233 cterm=NONE
hi CursorLineNr     guifg=#58a6ff guibg=#161b22 ctermfg=111 ctermbg=233 cterm=bold
hi Visual           guibg=#21262d ctermbg=235
hi Cursor           guifg=#0d1117 guibg=#c9d1d9 ctermfg=232 ctermbg=252
hi CursorColumn     guibg=#161b22 ctermbg=233

" UI Elements
hi ColorColumn      guibg=#161b22 ctermbg=233
hi SignColumn       guifg=#6e7681 guibg=#0d1117 ctermfg=242 ctermbg=232
hi Folded           guifg=#8b949e guibg=#161b22 ctermfg=246 ctermbg=233
hi VertSplit        guifg=#21262d guibg=#0d1117 ctermfg=235 ctermbg=232
hi StatusLine       guifg=#c9d1d9 guibg=#21262d ctermfg=252 ctermbg=235 cterm=bold
hi StatusLineNC     guifg=#8b949e guibg=#161b22 ctermfg=246 ctermbg=233
hi Pmenu            guifg=#c9d1d9 guibg=#21262d ctermfg=252 ctermbg=235
hi PmenuSel         guifg=#0d1117 guibg=#58a6ff ctermfg=232 ctermbg=111 cterm=bold
hi TabLine          guifg=#8b949e guibg=#161b22 ctermfg=246 ctermbg=233
hi TabLineSel       guifg=#c9d1d9 guibg=#21262d ctermfg=252 ctermbg=235 cterm=bold

" Search & Matching
hi Search           guifg=#0d1117 guibg=#58a6ff ctermfg=232 ctermbg=111
hi IncSearch        guifg=#0d1117 guibg=#56d4dd ctermfg=232 ctermbg=80 cterm=bold
hi MatchParen       guifg=#56d4dd guibg=#21262d ctermfg=80 ctermbg=235 cterm=bold

" Messages
hi ErrorMsg         guifg=#ff7b72 ctermfg=210 cterm=bold
hi WarningMsg       guifg=#d29922 ctermfg=178 cterm=bold
hi ModeMsg          guifg=#58a6ff ctermfg=111 cterm=bold
hi MoreMsg          guifg=#3fb950 ctermfg=77 cterm=bold

" Syntax Highlighting
hi Comment          guifg=#8b949e ctermfg=246 cterm=italic
hi Todo             guifg=#d29922 guibg=#161b22 ctermfg=178 ctermbg=233 cterm=bold
hi String           guifg=#a5d6ff ctermfg=153
hi Number           guifg=#79c0ff ctermfg=117
hi Boolean          guifg=#79c0ff ctermfg=117
hi Constant         guifg=#79c0ff ctermfg=117
hi Identifier       guifg=#ffa657 ctermfg=215
hi Function         guifg=#d2a8ff ctermfg=183 cterm=bold
hi Statement        guifg=#ff7b72 ctermfg=210 cterm=bold
hi Conditional      guifg=#ff7b72 ctermfg=210 cterm=bold
hi Repeat           guifg=#ff7b72 ctermfg=210 cterm=bold
hi Operator         guifg=#ff7b72 ctermfg=210
hi Keyword          guifg=#ff7b72 ctermfg=210 cterm=bold
hi PreProc          guifg=#79c0ff ctermfg=117
hi Type             guifg=#79c0ff ctermfg=117 cterm=bold
hi Special          guifg=#56d4dd ctermfg=80
hi Delimiter        guifg=#c9d1d9 ctermfg=252
hi Error            guifg=#ff7b72 guibg=#161b22 ctermfg=210 ctermbg=233 cterm=bold
hi Title            guifg=#58a6ff ctermfg=111 cterm=bold

" Diff
hi DiffAdd          guifg=#3fb950 guibg=#161b22 ctermfg=77 ctermbg=233
hi DiffChange       guifg=#58a6ff guibg=#161b22 ctermfg=111 ctermbg=233
hi DiffDelete       guifg=#ff7b72 guibg=#161b22 ctermfg=210 ctermbg=233
hi DiffText         guifg=#0d1117 guibg=#58a6ff ctermfg=232 ctermbg=111 cterm=bold

" Git
hi GitGutterAdd     guifg=#3fb950 guibg=#0d1117 ctermfg=77 ctermbg=232
hi GitGutterChange  guifg=#58a6ff guibg=#0d1117 ctermfg=111 ctermbg=232
hi GitGutterDelete  guifg=#ff7b72 guibg=#0d1117 ctermfg=210 ctermbg=232

" Additional
hi Directory        guifg=#58a6ff ctermfg=111 cterm=bold
hi SpecialKey       guifg=#21262d ctermfg=235
hi NonText          guifg=#21262d ctermfg=235
