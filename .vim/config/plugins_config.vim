""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Format Settings (using Neoformat)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoformat_python_docformatter = {
            \ 'exe': 'docformatter',
            \ 'args': ['-', '--wrap-summaries 100', '--wrap-descriptions 90'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_python = ['black', 'docformatter']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
let g:neoformat_try_formatprg = 1
let g:shfmt_opt="-ci"
let g:neoformat_run_all_formatters = 1
augroup filetype_python
    autocmd!
    autocmd FileType python let b:neoformat_run_all_formatters = 1
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-explorer settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc-vimlsp settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/lervag/vimtex/issues/1946#issuecomment-843674951
" => VimTeX highlight groups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi texCmd guifg=#ad3da4 guibg=NONE gui=NONE ctermfg=127 ctermbg=NONE cterm=NONE
hi! link texMathEnvArgName texEnvArgName
hi! link texMathZone LocalIdent
hi! link texMathZoneEnv texMathZone
hi! link texMathZoneEnvStarred texMathZone
hi! link texMathZoneX texMathZone
hi! link texMathZoneXX texMathZone
hi! link texMathZoneEnsured texMathZone

" Small tweaks
hi! link QuickFixLine Normal
hi! link qfLineNr Normal
hi! link EndOfBuffer LineNr
hi! link Conceal LocalIdent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => XCode color settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xcodelighthc_match_paren_style = 1
