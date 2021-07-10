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


call plug#end()

