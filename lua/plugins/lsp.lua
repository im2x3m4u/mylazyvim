-- local Util = require("lazyvim.util")

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
  -- {
  --   "SmiteshP/nvim-navbuddy",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   opts = { lsp = { auto_attach = true } },
  -- },
  -- -- add tsserver and setup with typescript.nvim instead of lspconfig
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "jose-elias-alvarez/typescript.nvim",
  --     init = function()
  --       require("lazyvim.util").lsp.on_attach(function(_, buffer)
  --         -- stylua: ignore
  --         vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
  --         vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
  --       end)
  --     end,
  --   },
  --   ---@class PluginLspOpts
  --   opts = function(_, opts)
  --     local cwd = vim.fn.getcwd()
  --     local util = require("lspconfig.util")
  --     local project_root = util.find_node_modules_ancestor(cwd)
  --
  --     local vue_path = util.path.join(project_root, "node_modules", "vue")
  --     local is_vue = vim.fn.isdirectory(vue_path) == 1
  --     if is_vue then
  --       opts.servers.volar = {
  --         -- vueserver = {
  --         --   max_old_space_size = 8192,
  --         -- },
  --         filetypes = {
  --           "vue",
  --           "javascript",
  --           "javascript.jsx",
  --           "typescript",
  --           "typescript.tsx",
  --           "javascriptreact",
  --           "typescriptreact",
  --           "json",
  --         },
  --       }
  --       opts.servers.ts_ls = {
  --         -- autostart = true,
  --         -- root_dir = function()
  --         --   return false
  --         -- end,
  --         root_dir = function(...)
  --           return require("lspconfig.util").root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(...)
  --         end,
  --         single_file_support = false,
  --         settings = {
  --           typescript = {
  --             inlayHints = {
  --               includeInlayParameterNameHints = "literal",
  --               includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --               includeInlayFunctionParameterTypeHints = true,
  --               includeInlayVariableTypeHints = false,
  --               includeInlayPropertyDeclarationTypeHints = true,
  --               includeInlayFunctionLikeReturnTypeHints = true,
  --               includeInlayEnumMemberValueHints = true,
  --             },
  --           },
  --           javascript = {
  --             inlayHints = {
  --               includeInlayParameterNameHints = "all",
  --               includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --               includeInlayFunctionParameterTypeHints = true,
  --               includeInlayVariableTypeHints = true,
  --               includeInlayPropertyDeclarationTypeHints = true,
  --               includeInlayFunctionLikeReturnTypeHints = true,
  --               includeInlayEnumMemberValueHints = true,
  --             },
  --           },
  --         },
  --       }
  --     end
  --
  --     -- disable inlay hints. it's just anoying
  --     opts.inlay_hints = {
  --       enabled = false,
  --     }
  --
  --     opts.setup = {
  --       -- example to setup with typescript.nvim
  --       ts_ls = function(_, opt)
  --         require("typescript").setup({ server = opt })
  --         return true
  --       end,
  --       -- Specify * to use this function as a fallback for any server
  --       -- ["*"] = function(server, opts) end,
  --     }
  --
  --     -- disable autoformat
  --     opts.autoformat = false
  --
  --     return opts
  --   end,
  --   config = function(_, opts)
  --     if LazyVim.has("neoconf.nvim") then
  --       local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
  --       require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))
  --     end
  --
  --     -- setup autoformat
  --     LazyVim.format.register(LazyVim.lsp.formatter())
  --
  --     -- setup keymaps
  --     LazyVim.lsp.on_attach(function(client, buffer)
  --       require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
  --     end)
  --
  --     local register_capability = vim.lsp.handlers["client/registerCapability"]
  --
  --     vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
  --       ---@diagnostic disable-next-line: no-unknown
  --       local ret = register_capability(err, res, ctx)
  --       local client = vim.lsp.get_client_by_id(ctx.client_id)
  --       local buffer = vim.api.nvim_get_current_buf()
  --       require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
  --       return ret
  --     end
  --
  --     -- diagnostics signs
  --     -- if vim.fn.has("nvim-0.10.0") == 0 then
  --     -- for severity, icon in pairs(opts.diagnostics.signs.text) do
  --     --   local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
  --     --   name = "DiagnosticSign" .. name
  --     --   vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
  --     -- end
  --     -- end
  --
  --     -- inlay hints
  --     if opts.inlay_hints.enabled then
  --       LazyVim.lsp.on_attach(function(client, buffer)
  --         if client.supports_method("textDocument/inlayHint") then
  --           LazyVim.toggle.inlay_hints(buffer, true)
  --         end
  --       end)
  --     end
  --
  --     -- code lens
  --     if opts.codelens.enabled and vim.lsp.codelens then
  --       LazyVim.lsp.on_attach(function(client, buffer)
  --         if client.supports_method("textDocument/codeLens") then
  --           vim.lsp.codelens.refresh()
  --           --- autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
  --           vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  --             buffer = buffer,
  --             callback = vim.lsp.codelens.refresh,
  --           })
  --         end
  --       end)
  --     end
  --
  --     if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
  --       opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
  --         or function(diagnostic)
  --           local icons = require("lazyvim.config").icons.diagnostics
  --           for d, icon in pairs(icons) do
  --             if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
  --               return icon
  --             end
  --           end
  --         end
  --     end
  --
  --     vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
  --
  --     local servers = opts.servers
  --     local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  --     local capabilities = vim.tbl_deep_extend(
  --       "force",
  --       {},
  --       vim.lsp.protocol.make_client_capabilities(),
  --       has_cmp and cmp_nvim_lsp.default_capabilities() or {},
  --       opts.capabilities or {}
  --     )
  --
  --     local function setup(server)
  --       local server_opts = vim.tbl_deep_extend("force", {
  --         capabilities = vim.deepcopy(capabilities),
  --       }, servers[server] or {})
  --
  --       if opts.setup[server] then
  --         if opts.setup[server](server, server_opts) then
  --           return
  --         end
  --       elseif opts.setup["*"] then
  --         if opts.setup["*"](server, server_opts) then
  --           return
  --         end
  --       end
  --       require("lspconfig")[server].setup(server_opts)
  --     end
  --
  --     -- get all the servers that are available through mason-lspconfig
  --     local have_mason, mlsp = pcall(require, "mason-lspconfig")
  --     local all_mslp_servers = {}
  --     if have_mason then
  --       all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
  --     end
  --
  --     local ensure_installed = {} ---@type string[]
  --     for server, server_opts in pairs(servers) do
  --       if server_opts then
  --         server_opts = server_opts == true and {} or server_opts
  --         -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
  --         if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
  --           setup(server)
  --         elseif server_opts.enabled ~= false then
  --           ensure_installed[#ensure_installed + 1] = server
  --         end
  --       end
  --     end
  --
  --     if have_mason then
  --       mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
  --     end
  --
  --     if LazyVim.lsp.get_config("denols") and LazyVim.lsp.get_config("ts_ls") then
  --       local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
  --       LazyVim.lsp.disable("ts_ls", is_deno)
  --       LazyVim.lsp.disable("denols", function(root_dir)
  --         return not is_deno(root_dir)
  --       end)
  --     end
  --   end,
  -- },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  -- { import = "lazyvim.plugins.extras.lang.typescript" },
  -- { import = "lazyvim.plugins.extras.lsp.none-ls" },
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

  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = function()
      ---@class PluginLspOpts
      local ret = {
        -- options for vim.diagnostic.config()
        ---@type vim.diagnostic.Opts
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
            -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
            -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
            -- prefix = "icons",
          },
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
              [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
              [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
              [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
            },
          },
        },
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the inlay hints.
        inlay_hints = {
          enabled = true,
          exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
        -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the code lenses.
        codelens = {
          enabled = false,
        },
        -- Enable lsp cursor word highlighting
        document_highlight = {
          enabled = true,
        },
        -- add any global capabilities here
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        -- options for vim.lsp.buf.format
        -- `bufnr` and `filter` is handled by the LazyVim formatter,
        -- but can be also overridden when specified
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- LSP Server Settings
        ---@type lspconfig.options
        servers = {
          lua_ls = {
            -- mason = false, -- set to false if you don't want this server to be installed with mason
            -- Use this to add any additional keymaps
            -- for specific lsp servers
            -- ---@type LazyKeysSpec[]
            -- keys = {},
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                },
                doc = {
                  privateName = { "^_" },
                },
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = "Disable",
                  semicolon = "Disable",
                  arrayIndex = "Disable",
                },
              },
            },
          },
        },
        -- you can do any additional lsp server setup here
        -- return true if you don't want this server to be setup with lspconfig
        ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
        setup = {
          -- example to setup with typescript.nvim
          -- tsserver = function(_, opts)
          --   require("typescript").setup({ server = opts })
          --   return true
          -- end,
          -- Specify * to use this function as a fallback for any server
          -- ["*"] = function(server, opts) end,
        },
      }
      return ret
    end,
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- setup autoformat
      LazyVim.format.register(LazyVim.lsp.formatter())

      -- setup keymaps
      LazyVim.lsp.on_attach(function(client, buffer)
        require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      LazyVim.lsp.setup()
      LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

      -- diagnostics signs
      if vim.fn.has("nvim-0.10.0") == 0 then
        if type(opts.diagnostics.signs) ~= "boolean" then
          for severity, icon in pairs(opts.diagnostics.signs.text) do
            local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
            name = "DiagnosticSign" .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
          end
        end
      end

      if vim.fn.has("nvim-0.10") == 1 then
        -- inlay hints
        if opts.inlay_hints.enabled then
          LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
            if
              vim.api.nvim_buf_is_valid(buffer)
              and vim.bo[buffer].buftype == ""
              and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
            then
              vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
            end
          end)
        end

        -- code lens
        if opts.codelens.enabled and vim.lsp.codelens then
          LazyVim.lsp.on_supports_method("textDocument/codeLens", function(client, buffer)
            vim.lsp.codelens.refresh()
            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
              buffer = buffer,
              callback = vim.lsp.codelens.refresh,
            })
          end)
        end
      end

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
          or function(diagnostic)
            local icons = LazyVim.config.icons.diagnostics
            for d, icon in pairs(icons) do
              if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                return icon
              end
            end
          end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        has_blink and blink.get_lsp_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
              setup(server)
            else
              ensure_installed[#ensure_installed + 1] = server
            end
          end
        end
      end

      if have_mason then
        mlsp.setup({
          ensure_installed = vim.tbl_deep_extend(
            "force",
            ensure_installed,
            LazyVim.opts("mason-lspconfig.nvim").ensure_installed or {}
          ),
          handlers = { setup },
        })
      end

      if LazyVim.lsp.is_enabled("denols") and LazyVim.lsp.is_enabled("vtsls") then
        local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        LazyVim.lsp.disable("vtsls", is_deno)
        LazyVim.lsp.disable("denols", function(root_dir, config)
          if not is_deno(root_dir) then
            config.settings.deno.enable = false
          end
          return false
        end)
      end
    end,
  },
}
