""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Enable universal ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gutentags_enabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimTeX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:vimtex_doc_handlers = ['vimtex#doc#handlers#texdoc']
let g:vimtex_imaps_enabled = 0
let g:vimtex_toc_config = { 'layers' : ['content'], 'show_help' : 0}
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_quickfix_method = 'pplatex'
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\vbox',
      \ 'Overfull \\vbox',
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Font',
      \ 'Float too large',
      \ 'Package caption',
      \]

let g:vimtex_complete_close_braces = 1
let g:vimtex_complete_ref = {
  \ 'custom_patterns': [
  \  '\\figref\*\?{[^}]*$',
  \  '\\secref\*\?{[^}]*$',
  \  '\\tabref\*\?{[^}]*$',
  \  '\\eqref\*\?{[^}]*$',
  \  '\\algref\*\?{[^}]*$',
  \  '\\partref\*\?{[^}]*$',
  \  '\\chapref\*\?{[^}]*$',
  \  ]
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=0
set colorcolumn=0
set spell
set iskeyword+=-  " enables ctags to find fig:this-sucks
set iskeyword+=\\ " enables ctags to find /my_shitty_command

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <localleader>c            <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
nmap <silent><nowait><leader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
nmap <localleader>v            <plug>(vimtex-view)
nmap <silent><nowait><leader>v <plug>(vimtex-view)
nmap <silent><nowait><leader>t <plug>(vimtex-toc-open)
nmap <silent><nowait><leader>o <plug>(vimtex-errors)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Viewer for Linux/macOS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("macunix")
  let g:vimtex_view_method = 'skim'
  " Backward search from pdf->vim in macOS
  function! s:TexFocusVim() abort
    silent execute "!open -a iTerm"
    redraw!
  endfunction

  augroup vimtex_event_focus
    au!
    au User VimtexEventViewReverse call s:TexFocusVim()
  augroup END
elseif has("unix")
  let g:vimtex_view_method = 'zathura'
endif
