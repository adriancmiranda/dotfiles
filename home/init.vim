" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" :: BRIEF HELP
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ## Getting started:
"
"  ```sh
"  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  ```
" 
"  then
" 
"  ```sh
"  nvim -c ":PlugInstall"
"  ```
"
" ## Shortcuts
"
" v: Select
" shift+v: Select entire line
" x: Cut
" yy: Copy an entire line
" p: Paste
" O: Insert a blank line
" u: Undo
" ctrl+r: Redo
"
"
" ## Mappings
"
" press <spacebar> and type <;>: put ; at all source code;
" press <spacebar> and type <reload>: source init.vim
" press <spacebar> and type <splith>: split nvim horizontally
" press <spacebar> and type <splitv>: split nvim vertically
"
" ctrl+p: Goto anything
" ctrl+shift?+up: Move line / selection up
" ctrl+shift?+down: Move line / selection down
" ctrl+shift?+d: Duplicate line
"
"
" <!-- References -->
" []: https://github.com/mhinz/vim-galore
" []: https://github.com/mutewinter/dot_vim
" []: https://github.com/ChristianChiarulli/LunarVim

" =============================================================================
" :: PLUGINS
" =============================================================================

" :: Plug
" :: @see https://github.com/junegunn/vim-plug
" -----------------------------------------------------------------------------
call plug#begin()
" :: 
" :: Welcome page
" :: 
Plug 'glepnir/dashboard-nvim' " or https://github.com/mhinz/vim-startify
" :: 
" :: Themes
" :: 
Plug 'ryanoasis/vim-devicons' " adds icons
Plug 'crusoexia/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
" :: 
" :: Syntax highlighters
" :: 
Plug 'sheerun/vim-polyglot'
" ::
" :: Code formatters
" ::
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" ::
" :: Code linters
" ::
Plug 'dense-analysis/ale'
" ::
" :: Code completions
" ::
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'codota/tabnine-vim'
" ::
" :: Code assistants
" ::
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim' " or https://github.com/rstacruz/sparkup
" ::
" :: Searching
" ::
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ::
" :: Distraction free
" ::
Plug 'junegunn/goyo.vim'
" ::
" :: Git
" ::
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
" ::
" :: Behaviors
" :: 
Plug 'psliwka/vim-smoothie'
call plug#end()



" :: PROVIDERS
" =============================================================================

" let g:node_host_prog = '/usr/local/bin/neovim-node-host'
" let g:ruby_host_prog = '/usr/bin/ruby'
" let g:python3_host_prog = '/usr/bin/python3'
" let g:python_host_prog = '/usr/bin/python'



" :: ENCODING
" =============================================================================

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8



" :: BACKUP
" =============================================================================

set nobackup
set nowritebackup
set noswapfile



" :: SEARCHING
" =============================================================================

set hlsearch



" :: WELCOME PAGE
" =============================================================================

" :: Dashboard NVIM
" :: @see https://github.com/glepnir/dashboard-nvim
" -----------------------------------------------------------------------------
let g:dashboard_custom_header = [
\"                                                    ",
\"                                 /     '      /  /  ",
\"                                /__      ___ (  /   ",
\"                                \\--\`-'-|\`---\\ | ",
\"  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ |' _/   \` __/ /   ",
\"   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \'._  W    ,--\'   ",
\"     ~~~~~~~~~~~~~~~~~~~~~~~~~ a.m. |_:_._/         ",
\"                                                    ",
\]



" :: VISUAL SETTINGS
" =============================================================================

syntax enable
syntax on

set background=dark

if (has("termguicolors"))
  set termguicolors
else
  set t_Co=256
endif



" :: THEMES
" =============================================================================

" :: vim-monokai
" :: @see https://github.com/crusoexia/vim-monokai
" -----------------------------------------------------------------------------
colorscheme monokai



" :: SYNTAX HIGHLIGHTERS
" =============================================================================

" :: Polyglot
" :: @see https://github.com/sheerun/vim-polyglot
" -----------------------------------------------------------------------------
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
set conceallevel=1

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
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1



" :: CODE FORMATTERS
" =============================================================================

" :: Prettier
" :: @see https://github.com/prettier/vim-prettier
" -----------------------------------------------------------------------------
" N/A



" :: CODE LINTERS
" =============================================================================

" :: ALE (Asynchronous Lint Engine)
" :: @see https://github.com/w0rp/ale
" -----------------------------------------------------------------------------
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\'javascript': ['eslint'],
\}



" :: CODE COMPLETIONS
" =============================================================================

" :: COC
" :: @see https://github.com/neoclide/coc.nvim
" -----------------------------------------------------------------------------
let g:coc_user_config = {
\}
let g:coc_global_extensions = [
\'coc-css',
\'coc-html',
\'coc-json',
\'coc-prettier',
\'coc-eslint',
\'coc-tsserver',
\'coc-snippets',
\]



" :: SEARCHINGS
" =============================================================================

" :: FZF
" :: @see https://github.com/junegunn/fzf
" -----------------------------------------------------------------------------
" in order to get `ag` runs `nix-env -iA silver-searcher`
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:fzf_action = {
\'ctrl-t': 'tab split',
\'ctrl-s': 'split',
\'ctrl-v': 'vsplit'
\}



" :: FOLDING
" =============================================================================
" N/A



" :: INDENTATION
" =============================================================================

filetype plugin indent on

set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set smartindent
set autoindent
set expandtab
set smarttab



" :: SETTINGS
" =============================================================================

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



" :: GIT
" =============================================================================

" :: Undotree
" :: @see https://github.com/mbbill/undotree
" -----------------------------------------------------------------------------
set undofile " set undotree to save to file



" :: MAPPINGS
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



