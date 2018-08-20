" PLUGINS:
" **********************

" Install Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" VIM LSP Stuff
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Other
Plug 'editorconfig/editorconfig-vim'
Plug 'mhinz/vim-signify'

" Theme
Plug 'flazz/vim-colorschemes'

call plug#end()







" REGISTER LSP SERVERS:
" **********************************

" Python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
    	\ 'workspace_config': {'pyls': { 'configurationSources': ['flake8', 'pycodestyle'] } },
        \ 'whitelist': ['python'],
        \ })
endif








" SETTINGS: 
" **********************

colorscheme Tomorrow-Night-Bright

set number		" Line numbers
set mouse=a		" Mouse
syntax on		" Syntax highlighting
set hlsearch		" Highlight all terms when searched using '/'
set cursorline		" Show line under where cursor is
set autoread		" Autoread files changed outside vim
set scrolloff=30	" Scroll offset
nnoremap * *``
" Pressing * does not move cursor


let g:lsp_async_completion=1					" LSP use async for autocompletion
let g:asyncomplete_remove_duplicates=1				" LSP optimization by reducing duplicate hint windows
let g:lsp_signs_enabled = 1					" LSP enable signs for warnings, errors, etc.
let g:lsp_diagnostics_echo_cursor = 1				" LSP show error of cursor line when in normal mode
let g:asyncomplete_smart_completion = 1				" LSP allow fuzzy autocompletion
let g:asyncomplete_auto_popup = 1				" LSP Allow auto-popup of suggestions (required for fuzzy autocompletion)
set completeopt-=preview					" LSP Disable preview window
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" Autoclose popup window

imap <c-space> <Plug>(asyncomplete_force_refresh)
" Ctrl+Space refreshes popup window


" Easier splitting ===
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
" ===

command T 15split | terminal
" Shortcut to create a split terminal window

autocmd TermOpen * setlocal nonumber norelativenumber
" Terminal don't show line numbers
