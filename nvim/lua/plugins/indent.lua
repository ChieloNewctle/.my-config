return {
  {
    "snacks.nvim",
    opts = {
      scope = {
        enabled = false,
      },
    },
  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({
        auto_cmd = true,
      })
    end,
    lazy = false,
  },
}
