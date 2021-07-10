" =============================================================================
" ░░░░ MAPPINGS
" =============================================================================

" Set a map leader for more key combos, so, press spacebar and then type...
let mapleader="\<space>"

" Reload NVim 
nnoremap <leader>reload :source ~/.config/nvim/init.vim<cr>

" Put ; at end of lines
nnoremap <leader>; A;<esc>

" :: Goto anything (ctrl+p)
" -----------------------------------------------------------------------------
nnoremap <C-p> :Files<CR>
