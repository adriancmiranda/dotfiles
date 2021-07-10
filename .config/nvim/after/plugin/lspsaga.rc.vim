" Language Server Protocol (LSP)
" =============================================================================
" ░░░░ @see https://github.com/glepnir/lspsaga.nvim
" =============================================================================

if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
  local status, lspSaga = pcall(require, 'lspsaga')
  
  if (not status) then return end

  lspSaga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    border_style = "round",
  }
EOF
