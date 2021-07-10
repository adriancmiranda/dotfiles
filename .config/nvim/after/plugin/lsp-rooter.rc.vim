" Welcome page
" =============================================================================
" ░░░░ @see https://github.com/ahmedkhalf/lsp-rooter.nvim
" =============================================================================

lua << EOF
  local status, lspRooter = pcall(require, 'lsp-rooter')
  
  if (not status) then return end
  
  lspRooter.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- ------------------------------------------------------------------------
    -- Table of lsp clients to ignore by name
    -- eg: {"efm", ...}
    ignore_lsp = {},
  }
EOF
