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
        "diff",
        "dart",
        "php",
        "json",
        "yaml",
        "python",
        "markdown",
        "markdown_inline",
        "vue",
        "gitignore",
        "graphql",
        "http",
        "scss",
        "query",
        "regex",
        "toml",
        "sql",
        "lua",
      },
      indent = {
        enable = true,
        disable = {
          "dart",
        },
      },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
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
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
