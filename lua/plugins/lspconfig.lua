return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      biome = {
        enabled = true,
      },
      cssls = {
        enabled = true,
      },
      denols = {
        enabled = false,
      },
      tailwindcss = {
        enabled = true,
      },
      volar = {
        enabled = true,
      },
      vtsls = {
        enabled = true,
      },
    },
    setup = {
      tailwindcss = function(_, opts)
        opts.settings = {
          tailwindCSS = {
            includeLanguages = {
              vue = "vue",
            },
          },
        }
      end,
      vtsls = function(_, opts)
        local vue_langserver_location = os.getenv('VUE_LANGUAGE_SERVER_DIR') or LazyVim.get_pkg_path("vue-language-server", "/node_modules/@vue/language-server")
        table.insert(opts.filetypes, "vue")
        LazyVim.extend(opts.settings, "vtsls.tsserver.globalPlugins", {
          {
            name = "@vue/typescript-plugin",
            location = vue_langserver_location,
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        })
      end,
    },
  },
}
