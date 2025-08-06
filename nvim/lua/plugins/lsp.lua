return {
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        clangd = {
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
        },
        yamlls = {
          settings = {
            yaml = {
              format = { enable = false },
            },
          },
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              require("schemastore").yaml.schemas()
            )
            new_config.settings.yaml.schemas["https://json.schemastore.org/traefik-v2.json"] = nil
          end,
          schemas = {
            ["https://json.schemastore.org/traefik-v3.json"] = { "traefik.yml", "traefik.yaml" },
          },
        },
      },
    },
  },
}
