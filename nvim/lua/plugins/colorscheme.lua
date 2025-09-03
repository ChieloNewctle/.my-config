return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "xiyaowong/transparent.nvim",
    enabled = not vim.g.neovide,
    lazy = false,
    opts = {
      extra_groups = { "NeoTreeNormal", "NeoTreeNormalNC" },
      exclude_groups = { "NotifyBackground" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    -- TODO: Remove this once https://github.com/LazyVim/LazyVim/pull/6354 is merged
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      bufline.get = bufline.get_theme
    end,
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "thick",
        hover = {
          enabled = true,
          delay = 120,
          reveal = { "close" },
        },
      },
    },
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   opts = {
  --     background_colour = "#000000",
  --   },
  -- },
}
