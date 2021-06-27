" :: VIM PLUG
" :: @see https://github.com/junegunn/vim-plug
" =============================================================================

call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'crusoexia/vim-monokai'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'codota/tabnine-vim'
call plug#end()


" :: STARTFY
" :: @see https://github.com/mhinz/vim-startify'
let g:startify_custom_header = [
\"                                                    ",
\"                                 /     '      /  /  ",
\"                                /__      ___ (  /   ",
\"                                \\--\`-'-|\`---\\ | ",
\"  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ |' _/   \` __/ /   ",
\"   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \'._  W    ,--\'   ",
\"     ~~~~~~~~~~~~~~~~~~~~~~~~~ a.m. |_:_._/         ",
\"                                                    ",
\]

" :: THEME
" :: @see https://github.com/crusoexia/vim-monokai
" -----------------------------------------------------------------------------
syntax enable
syntax on

set background=dark

colorscheme monokai

if (has("termguicolors"))
  set termguicolors
else
  set t_Co=256
endif

" :: TypeScript
" :: @see https://github.com/HerringtonDarkholme/yats.vim
" --
let g:typescript_conceal_function                  = "ƒ"
let g:typescript_conceal_null                      = "ø"
let g:typescript_conceal_undefined                 = "¿"
let g:typescript_conceal_this                      = "@"
let g:typescript_conceal_return                    = "⇚"
let g:typescript_conceal_prototype                 = "¶"
let g:typescript_conceal_super                     = "Ω"

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" :: JavaScript
" :: @see https://github.com/pangloss/vim-javascript 
" --
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function                  = "ƒ"
let g:javascript_conceal_null                      = "ø"
let g:javascript_conceal_this                      = "@"
let g:javascript_conceal_return                    = "⇚"
let g:javascript_conceal_undefined                 = "¿"
let g:javascript_conceal_NaN                       = "ℕ"
let g:javascript_conceal_prototype                 = "¶"
let g:javascript_conceal_static                    = "•"
let g:javascript_conceal_super                     = "Ω"
let g:javascript_conceal_arrow_function            = "⇒"
let g:javascript_conceal_noarg_arrow_function      = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1

" :: COC
" :: @see https://github.com/neoclide/coc.nvim
" -----------------------------------------------------------------------------
" N/A

" :: FZF
" :: @see https://github.com/junegunn/fzf
" -----------------------------------------------------------------------------
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " ag -> nix-env -iA silver-searcher
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-s': 'split',
\ 'ctrl-v': 'vsplit'
\}



" :: Encoding
" =============================================================================

set encoding=utf-8



" :: Folding
" =============================================================================




" :: Indentation
" =============================================================================

set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set smartindent
set autoindent
set expandtab
set smarttab



" :: Searching
" =============================================================================

set hlsearch



" :: Backup
" =============================================================================

set nobackup
set nowritebackup



" :: Settings
" =============================================================================

let g:ruby_host_prog = '/usr/bin/ruby'
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

set hidden
set number
set relativenumber
set mouse=a
set clipboard+=unnamedplus
set inccommand=split
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set autochdir
set laststatus=2
set cpoptions+=n
set vb
set list listchars=tab:\ \ ,trail:·



" :: Mappings
" =============================================================================

let mapleader="\<space>" " press spacebar and then type...

nnoremap <leader>reload :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>splith ~/.config/nvim/init.vim<cr>
nnoremap <leader>splitv ~/.config/nvim/init.vim<cr>
nnoremap <leader>; A;<esc>

" :: Goto anything (ctrl+p)
" -----------------------------------------------------------------------------
nnoremap <C-p> :Files<CR>

" :: Move line / selection up (ctrl+shift+up)
" -----------------------------------------------------------------------------
nnoremap <C-S-k> :m-2<cr>==
inoremap <C-S-k> <Esc>:m-2<CR>==gi
vnoremap <C-S-k> :m '<-2<CR>gv=gv

" :: Move line / selection down (ctrl+shift+down)
" -----------------------------------------------------------------------------
nnoremap <C-S-j> :m+1<cr>==
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv

" :: Duplicate line (ctrl+shift+d)
" -----------------------------------------------------------------------------
" @see https://stackoverflow.com/a/48734229/1345327
nmap <C-S-d> <Esc>Yp
imap <C-S-d> <Esc>Ypa



" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" :: Brief help
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" v: select
" shift+v: select entire line
" x: cut
" yy: copy an entire line
" p: paste
" O: insert a blank line
" u: undo
" ctrl+r: redo

