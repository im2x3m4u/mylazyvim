return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "php",
        "json",
        "yaml",
        "python",
        "markdown",
        "markdown_inline",
        "vue",
      },
      indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
      },
      -- nvim-ts-rainbow
      rainbow = {
        enable = true,
        extended_mode = true,
        -- Do not enable for files with more than 1000 lines, int
        max_file_lines = 1000,
        -- Which query to use for finding delimiters
        query = "rainbow-parents",
        -- Highlight the entire buffer all at once
        -- strategy = require("ts-rainbow").strategy.global,
      },
      -- nvim-ts-autotag
      autotag = {
        enable = true,
      },
      -- nvim-ts-context-commentstring
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<space><space>",
          node_incremental = "<space><space>",
          scope_incremental = "<c-S>",
          node_decremental = "<backspace>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>xp"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>xP"] = "@parameter.inner",
          },
        },
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>pf"] = "@function.outer",
            ["<leader>pc"] = "@class.outer",
          },
        },
      },
    },
  },
}