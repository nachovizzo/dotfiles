""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Format Settings (using Neoformat)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_python = ['black', 'docformatter', 'isort']
let g:neoformat_only_msg_on_error = 1
let g:neoformat_run_all_formatters = 1
let g:shfmt_opt="-ci"

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
" => NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => XCode color settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xcodelighthc_match_paren_style = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gutentags disabled by defualt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_enabled = 0
