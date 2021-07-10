" =============================================================================
" ░░░░ @see https://github.com/ahmedkhalf/lsp-rooter.nvim#vim-plug
" =============================================================================

lua << EOF
  require("lsp-rooter").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    ---------------------------------------------------------------------------
    -- Table of lsp clients to ignore by name
    -- eg: {"efm", ...}
    ignore_lsp = {},
  }
EOF

