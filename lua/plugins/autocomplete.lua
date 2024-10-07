return {
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufRead",
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set("i", "<c-c>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-n>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-m>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<c-f>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true })
  --   end,
  -- },
  -- {
  --   "Exafunction/codeium.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({})
  --   end,
  -- },
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    build = (not jit.os:find("Windows"))
        and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
      or nil,
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    -- stylua: ignore
    keys = {
    --   {
    --     "<tab>",
    --     function()
    --       return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
    --     end,
    --     expr = true,
    --     silent = true,
    --     mode = "i",
    --   },
    --   { "<tab>",   function() require("luasnip").jump(1) end,  mode = "s" },
    --   { "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
    },
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   dependencies = "copilot.lua",
  --   opts = {
  --     event = { "InsertEnter", "LspAttach" },
  --     fix_pairs = true,
  --   },
  --   config = function(_, opts)
  --     local copilot_cmp = require("copilot_cmp")
  --     copilot_cmp.setup(opts)
  --     -- attach cmp source whenever copilot attaches
  --     -- fixes lazy-loading issues with the copilot cmp source
  --     require("lazyvim.util").lsp.on_attach(function(client)
  --       if client.name == "copilot" then
  --         copilot_cmp._on_insert_enter({})
  --       end
  --     end)
  --   end,
  -- },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      -- "zbirenbaum/copilot-cmp",
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end

      opts.snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      }
      table.insert(opts.sources, { name = "luasnip", keyword_length = 2 })
      -- table.insert(opts.sources, { name = "fittencode" })
      -- table.insert(opts.sources, { name = "codeium" })
      -- table.insert(opts.sources, 1, {
      --   name = "copilot"   group_index = 1,
      --   priority = 100,
      -- })
      table.insert(opts.sources, { name = "nvim_lsp" })
      table.insert(opts.sources, { name = "path" })
      table.insert(opts.sources, { name = "buffer", keyword_length = 3 })
      -- table.insert(opts.sources, { name = "emoji" })
      table.insert(opts, { preselect = cmp.PreselectMode.None })
      table.insert(opts, {
        sources = { name = "fittencode", group_index = 1 },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            max_width = 50,
            symbol_map = { FittenCode = "" },
          }),
        },
      })

      -- Setup up vim-dadbod
      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })

      luasnip.config.set_config({
        history = false,
        updateevents = "TextChanged,TextChangedI",
      })

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
    config = function(_, opts)
      local cmp = require("cmp")

      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      cmp.setup(opts)
    end,
  },
}
