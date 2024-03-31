local Util = require("lazyvim.util")

return {
  -- add any tools you want to have installed below
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       "shellcheck",
  --       "shfmt",
  --       "flake8",
  --     },
  --   },
  -- },
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = { lsp = { auto_attach = true } },
  },
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = function(_, opts)
      local cwd = vim.fn.getcwd()
      local util = require("lspconfig.util")
      local project_root = util.find_node_modules_ancestor(cwd)

      local vue_path = util.path.join(project_root, "node_modules", "vue")
      local is_vue = vim.fn.isdirectory(vue_path) == 1
      if is_vue then
        opts.servers.volar = {
          -- vueserver = {
          --   max_old_space_size = 8192,
          -- },
          filetypes = {
            "vue",
            "javascript",
            "javascript.jsx",
            "typescript",
            "typescript.tsx",
            "javascriptreact",
            "typescriptreact",
            "json",
          },
        }
        opts.servers.tsserver = {
          autostart = false,
          root_dir = function()
            return false
          end,
          single_file_support = false,
        }
      end

      opts.setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opt)
          require("typescript").setup({ server = opt })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      }

      -- disable autoformat
      opts.autoformat = false

      return opts
    end,
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  -- { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lsp.none-ls" },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "LazyFile",
  --   dependencies = { "mason.nvim" },
  --   init = function()
  --     Util.on_very_lazy(function()
  --       -- register the formatter with LazyVim
  --       require("lazyvim.util").format.register({
  --         name = "none-ls.nvim",
  --         priority = 200, -- set higher than conform, the builtin formatter
  --         primary = true,
  --         format = function(buf)
  --           return Util.lsp.format({
  --             bufnr = buf,
  --             filter = function(client)
  --               return client.name == "null-ls"
  --             end,
  --           })
  --         end,
  --         sources = function(buf)
  --           local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
  --           return vim.tbl_map(function(source)
  --             return source.name
  --           end, ret)
  --         end,
  --       })
  --     end)
  --   end,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.root_dir = opts.root_dir
  --       or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
  --     opts.sources = vim.list_extend(opts.sources or {}, {
  --       nls.builtins.formatting.fish_indent,
  --       nls.builtins.diagnostics.fish,
  --       nls.builtins.formatting.stylua,
  --       nls.builtins.formatting.shfmt,
  --     })
  --   end,
  -- },
}
