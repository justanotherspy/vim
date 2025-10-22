" ============================================================================
" Claude - Anthropic Brand Colors Theme
" Inspired by Anthropic's brand guidelines
" ============================================================================

" Setup
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "claude"

" Anthropic Brand Colors
" Dark: #141413 (primary text and dark backgrounds)
" Light: #faf9f5 (light backgrounds and text on dark)
" Mid Gray: #b0aea5 (secondary elements)
" Light Gray: #e8e6dc (subtle backgrounds)
" Orange: #d97757 (primary accent)
" Blue: #6a9bcc (secondary accent)
" Green: #788c5d (tertiary accent)

" Editor Settings
hi Normal           guifg=#faf9f5 guibg=#141413 ctermfg=255 ctermbg=232
hi LineNr           guifg=#b0aea5 guibg=#141413 ctermfg=248 ctermbg=232
hi CursorLine       guibg=#1a1a19 ctermbg=233 cterm=NONE
hi CursorLineNr     guifg=#d97757 guibg=#1a1a19 ctermfg=173 ctermbg=233 cterm=bold
hi Visual           guibg=#2a2a28 ctermbg=235
hi VisualNOS        guibg=#2a2a28 ctermbg=235
hi Cursor           guifg=#141413 guibg=#faf9f5 ctermfg=232 ctermbg=255
hi CursorColumn     guibg=#1a1a19 ctermbg=233

" UI Elements
hi ColorColumn      guibg=#1a1a19 ctermbg=233
hi SignColumn       guifg=#b0aea5 guibg=#141413 ctermfg=248 ctermbg=232
hi Folded           guifg=#b0aea5 guibg=#1a1a19 ctermfg=248 ctermbg=233
hi FoldColumn       guifg=#b0aea5 guibg=#141413 ctermfg=248 ctermbg=232
hi VertSplit        guifg=#2a2a28 guibg=#141413 ctermfg=235 ctermbg=232
hi StatusLine       guifg=#faf9f5 guibg=#2a2a28 ctermfg=255 ctermbg=235 cterm=bold
hi StatusLineNC     guifg=#b0aea5 guibg=#1a1a19 ctermfg=248 ctermbg=233
hi Pmenu            guifg=#faf9f5 guibg=#2a2a28 ctermfg=255 ctermbg=235
hi PmenuSel         guifg=#141413 guibg=#d97757 ctermfg=232 ctermbg=173 cterm=bold
hi PmenuSbar        guibg=#2a2a28 ctermbg=235
hi PmenuThumb       guibg=#b0aea5 ctermbg=248
hi TabLine          guifg=#b0aea5 guibg=#1a1a19 ctermfg=248 ctermbg=233
hi TabLineFill      guibg=#1a1a19 ctermbg=233
hi TabLineSel       guifg=#faf9f5 guibg=#2a2a28 ctermfg=255 ctermbg=235 cterm=bold

" Search & Matching
hi Search           guifg=#141413 guibg=#d97757 ctermfg=232 ctermbg=173
hi IncSearch        guifg=#141413 guibg=#6a9bcc ctermfg=232 ctermbg=110 cterm=bold
hi MatchParen       guifg=#d97757 guibg=#2a2a28 ctermfg=173 ctermbg=235 cterm=bold

" Messages & Prompts
hi ErrorMsg         guifg=#faf9f5 guibg=#d97757 ctermfg=255 ctermbg=173 cterm=bold
hi WarningMsg       guifg=#d97757 ctermfg=173 cterm=bold
hi ModeMsg          guifg=#6a9bcc ctermfg=110 cterm=bold
hi MoreMsg          guifg=#788c5d ctermfg=108 cterm=bold
hi Question         guifg=#6a9bcc ctermfg=110 cterm=bold

" Syntax Highlighting
hi Comment          guifg=#b0aea5 ctermfg=248 cterm=italic
hi Todo             guifg=#d97757 guibg=#1a1a19 ctermfg=173 ctermbg=233 cterm=bold
hi String           guifg=#788c5d ctermfg=108
hi Character        guifg=#788c5d ctermfg=108
hi Number           guifg=#d97757 ctermfg=173
hi Boolean          guifg=#d97757 ctermfg=173
hi Float            guifg=#d97757 ctermfg=173
hi Constant         guifg=#d97757 ctermfg=173
hi Identifier       guifg=#6a9bcc ctermfg=110
hi Function         guifg=#6a9bcc ctermfg=110 cterm=bold
hi Statement        guifg=#d97757 ctermfg=173 cterm=bold
hi Conditional      guifg=#d97757 ctermfg=173 cterm=bold
hi Repeat           guifg=#d97757 ctermfg=173 cterm=bold
hi Label            guifg=#d97757 ctermfg=173
hi Operator         guifg=#faf9f5 ctermfg=255
hi Keyword          guifg=#d97757 ctermfg=173 cterm=bold
hi Exception        guifg=#d97757 ctermfg=173 cterm=bold
hi PreProc          guifg=#6a9bcc ctermfg=110
hi Include          guifg=#6a9bcc ctermfg=110
hi Define           guifg=#6a9bcc ctermfg=110
hi Macro            guifg=#6a9bcc ctermfg=110
hi PreCondit        guifg=#6a9bcc ctermfg=110
hi Type             guifg=#6a9bcc ctermfg=110 cterm=bold
hi StorageClass     guifg=#6a9bcc ctermfg=110 cterm=bold
hi Structure        guifg=#6a9bcc ctermfg=110 cterm=bold
hi Typedef          guifg=#6a9bcc ctermfg=110 cterm=bold
hi Special          guifg=#d97757 ctermfg=173
hi SpecialChar      guifg=#d97757 ctermfg=173
hi Tag              guifg=#6a9bcc ctermfg=110
hi Delimiter        guifg=#e8e6dc ctermfg=253
hi SpecialComment   guifg=#b0aea5 ctermfg=248 cterm=bold
hi Debug            guifg=#d97757 ctermfg=173 cterm=bold
hi Underlined       guifg=#6a9bcc ctermfg=110 cterm=underline
hi Ignore           guifg=#2a2a28 ctermfg=235
hi Error            guifg=#faf9f5 guibg=#d97757 ctermfg=255 ctermbg=173 cterm=bold
hi Title            guifg=#d97757 ctermfg=173 cterm=bold

" Diff
hi DiffAdd          guifg=#788c5d guibg=#1a1a19 ctermfg=108 ctermbg=233
hi DiffChange       guifg=#6a9bcc guibg=#1a1a19 ctermfg=110 ctermbg=233
hi DiffDelete       guifg=#d97757 guibg=#1a1a19 ctermfg=173 ctermbg=233
hi DiffText         guifg=#faf9f5 guibg=#6a9bcc ctermfg=255 ctermbg=110 cterm=bold

" Spell Checking
hi SpellBad         guisp=#d97757 gui=undercurl ctermfg=173 cterm=underline
hi SpellCap         guisp=#6a9bcc gui=undercurl ctermfg=110 cterm=underline
hi SpellRare        guisp=#788c5d gui=undercurl ctermfg=108 cterm=underline
hi SpellLocal       guisp=#6a9bcc gui=undercurl ctermfg=110 cterm=underline

" Git/Version Control (for plugins like vim-gitgutter)
hi GitGutterAdd     guifg=#788c5d guibg=#141413 ctermfg=108 ctermbg=232
hi GitGutterChange  guifg=#6a9bcc guibg=#141413 ctermfg=110 ctermbg=232
hi GitGutterDelete  guifg=#d97757 guibg=#141413 ctermfg=173 ctermbg=232

" Additional UI
hi Directory        guifg=#6a9bcc ctermfg=110 cterm=bold
hi SpecialKey       guifg=#2a2a28 ctermfg=235
hi NonText          guifg=#2a2a28 ctermfg=235
hi Conceal          guifg=#b0aea5 ctermfg=248
hi WildMenu         guifg=#141413 guibg=#d97757 ctermfg=232 ctermbg=173 cterm=bold
