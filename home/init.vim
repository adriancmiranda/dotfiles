" :: VIM PLUG
" :: @see https://github.com/junegunn/vim-plug
" =============================================================================

call plug#begin()
Plug 'crusoexia/vim-monokai'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()



" :: THEME
" :: @see https://github.com/crusoexia/vim-monokai
" -----------------------------------------------------------------------------
syntax on
colorscheme monokai
set termguicolors " or " set t_Co=256

" :: TypeScript
" :: @see https://github.com/HerringtonDarkholme/yats.vim
" --
let g:typescript_conceal_function             = "ƒ"
let g:typescript_conceal_null                 = "ø"
let g:typescript_conceal_undefined            = "¿"
let g:typescript_conceal_this                 = "@"
let g:typescript_conceal_return               = "⇚"
let g:typescript_conceal_prototype            = "¶"
let g:typescript_conceal_super                = "Ω"

set conceallevel=1

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" :: COC
" :: @see https://github.com/neoclide/coc.vim
" -----------------------------------------------------------------------------
" N/A



" :: Settings
" =============================================================================

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:ruby_host_prog = '/usr/bin/ruby'

set encoding=utf-8
set hidden
set number
set relativenumber
set mouse=a
set clipboard+=unnamedplus
set inccommand=split
set nobackup
set nowritebackup
set autochdir
set autoindent



" :: Remap
" =============================================================================

let mapleader="\<space>" " press spacebar and then type...

nnoremap <leader>reload :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>splith ~/.config/nvim/init.vim<cr>
nnoremap <leader>splitv ~/.config/nvim/init.vim<cr>
nnoremap <leader>; A;<esc>



" :: Shortcuts
" =============================================================================

" ctrl+shift+d: duplicate line
" @see https://stackoverflow.com/a/48734229/1345327
nmap <S-C-d> <Esc>Yp



" :: References
" =============================================================================

" v: select
" shift+v: select entire line
" x: cut
" yy: copy an entire line
" p: paste
" O: insert a blank line
" u: undo
" ctrl+r: redo


