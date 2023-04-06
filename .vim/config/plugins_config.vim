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
" => VimTeX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_method = 'skim'
let g:vimtex_imaps_enabled = 0
let g:vimtex_toc_config = { 'layers' : ['content'], 'show_help' : 0}
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_quickfix_method = 'pplatex'
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\vbox',
      \ 'Overfull \\vbox',
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => XCode color settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xcodelighthc_match_paren_style = 1
