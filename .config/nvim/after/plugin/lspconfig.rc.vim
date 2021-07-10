" Language Server Protocol (LSP)
" =============================================================================
" ░░░░ @see https://github.com/neovim/nvim-lspconfig
" =============================================================================

if !exists('g:lspconfig') | finish | endif

lua << EOF
  local configStatus, lspConfig = pcall(require, 'lspconfig')
  
  if (not configStatus) then return end
EOF
