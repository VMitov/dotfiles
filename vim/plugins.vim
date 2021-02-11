"""""""""""""""""
" Plugin Config "
"""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim'
Plug 'jooize/vim-colemak'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-plug'
Plug 'kien/ctrlp.vim'
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/scrollfix'
call plug#end()

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'

" vim-go
let g:go_fmt_experimental = 1
let g:go_fmt_command = 'goimports'
let g:go_metalinter_command = 'golangci-lint run'

" vim-terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" Lightline config
set laststatus=2
set noshowmode
let g:lightline = {
  \   'colorscheme': 'onedark',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'githunks', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'githunks': 'LightlineGitGutter',
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
function! LightlineGitGutter()
  if !get(g:, 'gitgutter_enabled', 0) || empty(FugitiveHead())
    return ''
  endif
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', l:added, l:modified, l:removed)
endfunction
