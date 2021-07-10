" =============================================================================
" ░░░░ @see https://github.com/kyazdani42/nvim-web-devicons
" =============================================================================

lua << EOF
  local status, nvimWebDevicons = pcall(require, 'nvim-web-devicons')
  
  if (not status) then return end
  
  nvimWebDevicons.setup {
    -- your personnal icons can go here (to override)
    -- DevIcon will be appended to `name`
    override = {};
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
  }
EOF
