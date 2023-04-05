" coc.nvim extensions
let g:coc_global_extensions = [
      \'coc-clangd',
      \'coc-cmake',
      \'coc-emoji',
      \'coc-explorer',
      \'coc-json',
      \'coc-lua',
      \'coc-markdownlint',
      \'coc-pyright',
      \'coc-vimlsp',
      \'coc-vimtex',
      \'coc-word',
      \'coc-yaml',
      \]

" Add custom commands
command! -nargs=0 Format    :call CocActionAsync('format')
command! -nargs=0 OR        :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 CocToggle :call CocAction('diagnosticToggle')

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Keystrokes mappings
nmap <silent><M-o> :CocCommand clangd.switchSourceHeader<cr>
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>cf <Plug>(coc-fix-current)
