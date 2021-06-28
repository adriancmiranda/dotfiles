" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" :: BRIEF HELP
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ## Getting started:
"
"  Install [nerd fonts](https://www.nerdfonts.com/)
"
"  ```sh
"  brew install --HEAD tree-sitter luajit neovim
"  ```
"
"  then
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
" o: Insert a blank line at the bottom
" O: Insert a blank line at the top
" u: Undo
" ctrl+r: Redo
" <number>+up: Move the cursor <number> lines to up
" <number>+down: Move the cursor <number> lines to down
" <number>+left: Move the cursor <number> columns to left
" <number>+right: Move the cursor <number> columns to right
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
" []: https://github.com/itmecho/neoterm.nvim
" []: https://www.youtube.com/watch?v=FW2X1CXrU1w

" =============================================================================
" :: PLUGINS
" =============================================================================

" Include user's extra bundle in order to preset some rules of plugins e.g. `sheerun/vim-polyglot`
if filereadable(expand("~/preset.vim"))
  source ~/preset.vim
endif

" :: Plug
" :: @see https://github.com/junegunn/vim-plug
" -----------------------------------------------------------------------------
call plug#begin()
" ::
" :: Icons
" ::
Plug 'kyazdani42/nvim-web-devicons'" adds icons, dependents: romgrk/barbar.nvim, mhinz/vim-startify
" ::
" :: Welcome page
" ::
Plug 'mhinz/vim-startify'" or Plug 'glepnir/dashboard-nvim'
" ::
" :: File tabs
" ::
Plug 'romgrk/barbar.nvim'" it depends on kyazdani42/nvim-web-devicons if you want to display icons
" ::
" :: Themes
" ::
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
Plug 'mattn/emmet-vim'" or Plug 'rstacruz/sparkup'
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
"set fileencoding=utf-8
"set fileencodings=utf-8
set fileformats=unix,dos,mac
set bomb
set binary
set ttyfast" faster redrawing


" :: BACKUP
" =============================================================================

set nobackup
set nowritebackup
set noswapfile



" :: SEARCHING
" =============================================================================

set hlsearch
set incsearch" set incremental search, like modern browsers
set ignorecase" case insensitive searching
set smartcase" case-sensitive if expresson contains a capital letter
set nolazyredraw" don't redraw while executing macros
set magic" Set magic on, for regex
set showmatch" show matching braces
set mat=2" how many tenths of a second to blink



" :: WELCOME PAGE
" =============================================================================

" :: Startify
" :: @see https://github.com/mhinz/vim-startify
" -----------------------------------------------------------------------------
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



" :: FILE TABS
" =============================================================================

" :: Barbar status bar
" :: @see https://github.com/romgrk/barbar.nvim
" -----------------------------------------------------------------------------
let $PLUGIN_DIRECTORY = '~/.config/nvim/plugged'
set runtimepath^=$PLUGIN_DIRECTORY/nvim-web-devicons
set runtimepath^=$PLUGIN_DIRECTORY/barbar.nvim

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:false

" Enable/disable icons
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" If set, the icon color will follow its corresponding buffer
" highlight group. By default, the Buffer*Icon group is linked to the
" Buffer* group (see Highlighting below). Otherwise, it will take its
" default value as defined by devicons.
let bufferline.icon_custom_colors = v:true

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the maximum padding width with which to surround each tab
let bufferline.maximum_padding = 4

" Sets the name of unsaved buffers
let bufferline.no_name_title = v:null



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



" :: INDENTATION
" =============================================================================

filetype plugin indent on" required
" In order to ignore plugin indent changes, instead, use:
"filetype plugin on

set backspace=indent,eol,start" Fix backspace indent
set shiftround" round indent to a multiple of 'shiftwidth'
set shiftwidth=2" number of spaces to use for indent and unindent
set tabstop=2" the visible width of tabs
set softtabstop=0" edit as if the tabs are 0 characters wide
set smarttab" tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set expandtab" tabs ftw
set autoindent" automatically set indent of new line
set smartindent



" :: CODE FOLDING
" =============================================================================

set foldmethod=syntax" fold based on indent
set foldnestmax=10" deepest fold is 10 levels
set nofoldenable" don't fold by default
set foldlevel=1



" :: WHITE SPACES
" =============================================================================

set list
set listchars=tab:▸·,trail:~,eol:¬,extends:>,precedes:<,space:·
set listchars=tab:├·,trail:~,eol:¬,extends:>,precedes:<,space:·
set listchars=tab:├─,trail:·,eol:¬,extends:>,precedes:<,space:·
set lcs+=space:·



" :: STATUS BAR
" =============================================================================

set showcmd
set cmdheight=2
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\



" :: CURSOR
" =============================================================================

set cursorline
set cursorcolumn
set colorcolumn=120



" :: SETTINGS
" =============================================================================

set paste
set shell=/bin/sh
set hidden" Enable hidden buffers
set number
set relativenumber
" set guifont=DroidSansMono\ Nerd\ Font\ 11
set guioptions=egmrti
set gfn=Menlo:h12
set mouse=a
set mousemodel=popup
set clipboard+=unnamedplus
set inccommand=split
set updatetime=300
set shortmess+=c
set signcolumn=yes
set autochdir
set cpoptions+=n
set ruler
set vb
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F



" :: GIT
" =============================================================================

" :: Undotree
" :: @see https://github.com/mbbill/undotree
" -----------------------------------------------------------------------------
set undofile" set undotree to save to file



" :: MAPPINGS
" =============================================================================

let mapleader="\<space>"" set a map leader for more key combos, so, press spacebar and then type...

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
