" =============================================================================
" ░░░░ PLUGINS
" =============================================================================

" :: Plug
" :: @see https://github.com/junegunn/vim-plug
" -----------------------------------------------------------------------------

if has("nvim")
  " Specify a directory for plugins
  " For Neovim:
  let g:plug_home = stdpath('data') . '/plugged'
  " ! Avoid using standard Vim directory names like 'plugin'
endif

call plug#begin()
" ~~
" !! Make sure you use single quotes to plugs
" ~~
" ::
" :: Language Server Protocol (LSP)
" ::

Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/glepnir/lspsaga.nvim'


" ::
" :: Searching
" ::
" :: [requires]:
" :: -https://github.com/ggreer/the_silver_searcher
" :: -https://github.com/BurntSushi/ripgrep

" :: Telescope
Plug 'https://github.com/nvim-lua/popup.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim'

" :: Clap
Plug 'https://github.com/liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }

" :: FZF
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'


" :: 
" :: Icons
" ::
" :: [required]:
" :: -https://github.com/romgrk/barbar.nvim
" :: -https://github.com/mhinz/vim-startify
" :: -https://github.com/kyazdani42/nvim-tree.lua

Plug 'https://github.com/kyazdani42/nvim-web-devicons'


" ::
" :: Themes
" ::

Plug 'https://github.com/crusoexia/vim-monokai'
Plug 'https://github.com/arcticicestudio/nord-vim'
Plug 'https://github.com/ayu-theme/ayu-vim'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/rktjmp/lush.nvim'" Create another color schemes


" ::
" :: Welcome page
" ::
" :: [requires]:
" :: -https://github.com/kyazdani42/nvim-web-devicons
" :: -https://github.com/junegunn/fzf
" ::
" :: [options]:
" :: -https://github.com/ahmedkhalf/lsp-rooter.nvim
" :: -https://github.com/ChristianChiarulli/dashboard-nvim

Plug 'https://github.com/ChristianChiarulli/dashboard-nvim'


" ::
" :: File tabs
" ::
" :: [requires]:
" :: -https://github.com/kyazdani42/nvim-web-devicons

Plug 'https://github.com/romgrk/barbar.nvim'


" ::
" :: File explorer
" ::
" :: [requires]:
" :: -https://github.com/kyazdani42/nvim-web-devicons
" ::
" :: [options]:
" :: -https://github.com/preservim/nerdtree

Plug 'https://github.com/kyazdani42/nvim-tree.lua'


" ::
" :: Scroll behavior
" ::

Plug 'https://github.com/psliwka/vim-smoothie'


" ::
" :: Status line
" ::
" :: [requires]:
" :: -https://github.com/kyazdani42/nvim-web-devicons
" ::
" :: [options]:
" :: -https://github.com/hoob3rt/lualine.nvim

Plug 'https://github.com/glepnir/galaxyline.nvim' , { 'branch': 'main' }


" ::
" :: Distraction free
" ::
" :: [options]:
" :: -https://github.com/junegunn/goyo.vim

Plug 'https://github.com/folke/zen-mode.nvim'


" https://github.com/sindrets/diffview.nvim
" https://github.com/folke/trouble.nvim
" https://github.com/simrat39/symbols-outline.nvim
" https://github.com/JoosepAlviste/nvim-ts-context-commentstring
" https://github.com/nacro90/numb.nvim
" https://github.com/norcalli/nvim-colorizer.lua
" https://github.com/kevinhwang91/rnvimr
" https://github.com/phaazon/hop.nvim
" https://github.com/folke/which-key.nvim
" https://github.com/cohama/lexima.vim
" https://github.com/andymass/vim-matchup
" https://github.com/numToStr/FTerm.nvim
" https://github.com/windwp/nvim-spectre
" https://github.com/iamcco/markdown-preview.nvim
" https://github.com/metakirby5/codi.vim
" https://github.com/turbio/bracey.vim
" https://github.com/vim-scripts/RltvNmbr.vim
call plug#end()

