return {
  {
    "stevearc/conform.nvim",
    -- dependencies = { "mason.nvim", "folke/neoconf.nvim" },
    opts = function()
      return {
        -- format = {
        --   timeout_ms = 3000,
        --   async = false, -- not recommended to change
        --   quiet = false, -- not recommended to change
        -- },
        formatters = {
          injected = { options = { ignore_errors = true } },
          rustfmt = {
            options = {
              -- The default edition of Rust to use when no Cargo.toml file is found
              default_edition = "2024",
            },
          },
          shfmt = { prepend_args = { "-i", "4" } },
        },
        formatters_by_ft = {
          bash = { "shfmt" },
          c = { "clang-format" },
          cmake = { "gersemi" },
          cpp = { "clang-format" },
          css = { "deno_fmt" },
          cuda = { "clang-format" },
          html = { "deno_fmt" },
          javascript = { "deno_fmt" },
          json = { "deno_fmt" },
          json5 = { "prettier" },
          jsonc = { "deno_fmt" },
          lua = { "stylua" },
          markdown = { "deno_fmt", "cbfmt" },
          python = { "ruff_format" },
          rust = { "rustfmt" },
          scss = { "deno_fmt" },
          sh = { "shfmt" },
          toml = { "tombi" },
          typescript = { "deno_fmt" },
          typescriptreact = { "deno_fmt" },
          typst = { "typstyle" },
          yaml = { "yamlfmt" },
          zsh = { "shfmt" },
        },
      }
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "cbfmt",
        "clang-format",
        "cmakelang",
        "deno",
        "gersemi",
        "prettier",
        "ruff",
        "shfmt",
        "stylua",
        "tombi",
        "typstyle",
        "yamlfmt",
      },
    },
  },
}
