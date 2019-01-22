set encoding=utf-8
scriptencoding utf-8

set nocompatible
set modeline
set laststatus=2

if !filereadable(expand('./tmp/plug.vim'))
  silent !curl --insecure -fLo ./tmp/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

source ./tmp/plug.vim

call plug#begin('./tmp/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim', { 'commit': 'c4d93a8' }
let g:asyncomplete_smart_completion = 0

Plug 'prabirshrestha/vim-lsp', { 'commit': '1aba956' }
Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'commit': 'b9630e2' }

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('./tmp/vim-lsp.log')
let g:asyncomplete_log_file = expand('./tmp/asyncomplete.log')

autocmd User lsp_setup call lsp#register_server({
\ 'name': 'gopls',
\ 'cmd': {server_info->['bin/gopls']},
\ 'whitelist': ['go']
\ })

if executable('pyls')
  autocmd User lsp_setup call lsp#register_server({
  \ 'name': 'pyls',
  \ 'cmd': {server_info->['pyls']},
  \ 'whitelist': ['python'],
  \ })
endif

call plug#end()

