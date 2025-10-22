" ============================================================================
" Monochrome - Clean Black and White Theme
" A minimalist theme focused on clarity and simplicity
" ============================================================================

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "monochrome"

" Color Palette - Grayscale
" Black: #0a0a0a, #1a1a1a, #2a2a2a
" Gray: #4a4a4a, #6a6a6a, #8a8a8a
" White: #aaaaaa, #cccccc, #eeeeee, #ffffff

" Editor Settings
hi Normal           guifg=#eeeeee guibg=#0a0a0a ctermfg=255 ctermbg=232
hi LineNr           guifg=#6a6a6a guibg=#0a0a0a ctermfg=242 ctermbg=232
hi CursorLine       guibg=#1a1a1a ctermbg=233 cterm=NONE
hi CursorLineNr     guifg=#ffffff guibg=#1a1a1a ctermfg=231 ctermbg=233 cterm=bold
hi Visual           guibg=#2a2a2a ctermbg=235
hi Cursor           guifg=#0a0a0a guibg=#eeeeee ctermfg=232 ctermbg=255
hi CursorColumn     guibg=#1a1a1a ctermbg=233

" UI Elements
hi ColorColumn      guibg=#1a1a1a ctermbg=233
hi SignColumn       guifg=#6a6a6a guibg=#0a0a0a ctermfg=242 ctermbg=232
hi Folded           guifg=#8a8a8a guibg=#1a1a1a ctermfg=245 ctermbg=233
hi VertSplit        guifg=#2a2a2a guibg=#0a0a0a ctermfg=235 ctermbg=232
hi StatusLine       guifg=#eeeeee guibg=#2a2a2a ctermfg=255 ctermbg=235 cterm=bold
hi StatusLineNC     guifg=#8a8a8a guibg=#1a1a1a ctermfg=245 ctermbg=233
hi Pmenu            guifg=#eeeeee guibg=#2a2a2a ctermfg=255 ctermbg=235
hi PmenuSel         guifg=#0a0a0a guibg=#ffffff ctermfg=232 ctermbg=231 cterm=bold
hi TabLine          guifg=#8a8a8a guibg=#1a1a1a ctermfg=245 ctermbg=233
hi TabLineSel       guifg=#eeeeee guibg=#2a2a2a ctermfg=255 ctermbg=235 cterm=bold

" Search & Matching
hi Search           guifg=#0a0a0a guibg=#cccccc ctermfg=232 ctermbg=252
hi IncSearch        guifg=#0a0a0a guibg=#ffffff ctermfg=232 ctermbg=231 cterm=bold
hi MatchParen       guifg=#ffffff guibg=#2a2a2a ctermfg=231 ctermbg=235 cterm=bold

" Messages
hi ErrorMsg         guifg=#ffffff guibg=#4a4a4a ctermfg=231 ctermbg=239 cterm=bold
hi WarningMsg       guifg=#cccccc ctermfg=252 cterm=bold
hi ModeMsg          guifg=#ffffff ctermfg=231 cterm=bold
hi MoreMsg          guifg=#cccccc ctermfg=252 cterm=bold

" Syntax Highlighting - Using different shades for distinction
hi Comment          guifg=#6a6a6a ctermfg=242 cterm=italic
hi Todo             guifg=#ffffff guibg=#1a1a1a ctermfg=231 ctermbg=233 cterm=bold
hi String           guifg=#aaaaaa ctermfg=248
hi Number           guifg=#cccccc ctermfg=252
hi Boolean          guifg=#cccccc ctermfg=252
hi Constant         guifg=#cccccc ctermfg=252
hi Identifier       guifg=#eeeeee ctermfg=255
hi Function         guifg=#ffffff ctermfg=231 cterm=bold
hi Statement        guifg=#eeeeee ctermfg=255 cterm=bold
hi Conditional      guifg=#eeeeee ctermfg=255 cterm=bold
hi Repeat           guifg=#eeeeee ctermfg=255 cterm=bold
hi Operator         guifg=#cccccc ctermfg=252
hi Keyword          guifg=#eeeeee ctermfg=255 cterm=bold
hi PreProc          guifg=#cccccc ctermfg=252
hi Type             guifg=#eeeeee ctermfg=255 cterm=bold
hi Special          guifg=#cccccc ctermfg=252
hi Delimiter        guifg=#aaaaaa ctermfg=248
hi Error            guifg=#ffffff guibg=#4a4a4a ctermfg=231 ctermbg=239 cterm=bold
hi Title            guifg=#ffffff ctermfg=231 cterm=bold

" Diff
hi DiffAdd          guifg=#aaaaaa guibg=#1a1a1a ctermfg=248 ctermbg=233 cterm=bold
hi DiffChange       guifg=#cccccc guibg=#1a1a1a ctermfg=252 ctermbg=233
hi DiffDelete       guifg=#6a6a6a guibg=#1a1a1a ctermfg=242 ctermbg=233
hi DiffText         guifg=#0a0a0a guibg=#eeeeee ctermfg=232 ctermbg=255 cterm=bold

" Git
hi GitGutterAdd     guifg=#aaaaaa guibg=#0a0a0a ctermfg=248 ctermbg=232
hi GitGutterChange  guifg=#cccccc guibg=#0a0a0a ctermfg=252 ctermbg=232
hi GitGutterDelete  guifg=#6a6a6a guibg=#0a0a0a ctermfg=242 ctermbg=232

" Additional
hi Directory        guifg=#ffffff ctermfg=231 cterm=bold
hi SpecialKey       guifg=#2a2a2a ctermfg=235
hi NonText          guifg=#2a2a2a ctermfg=235
