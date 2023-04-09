" Configure python formatters to my own liking :)
let g:neoformat_python_black = {
      \ 'exe': 'black',
      \ 'args': ['-q', '-', '--line-length', '100'],
      \ 'stdin': 1,
      \ }
let g:neoformat_python_docformatter = {
      \ 'exe': 'docformatter',
      \ 'args': ['-', '--wrap-summaries 100', '--wrap-descriptions 90'],
      \ 'stdin': 1,
      \ }

let g:neoformat_python_python = {
      \ 'exe': 'isort',
      \ 'args': ['-', '--quiet', "--profile", "black", "--filter-files" ,'--line-length', '10'],
      \ 'stdin': 1,
      \ }
