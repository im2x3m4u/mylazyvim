local Util = require("lazyvim.util")

local colors = {
  red = "#ca1243",
  grey = "#a0a1a7",
  black = "#383a42",
  white = "#f3f3f3",
  light_green = "#83a598",
  orange = "#fe8019",
  green = "#8ec07c",
  dark = "#1F242F",
  violet = "#4400D8",
}
-- start for lsp
local list_registered_providers_names = function(filetype)
  local s = require("null-ls.sources")
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

local null_ls = require("null-ls")
-- for formatter
local list_registered = function(filetype)
  local method = null_ls.methods.FORMATTING
  local registered_providers = list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

--- for linter
local alternative_methods = {
  null_ls.methods.DIAGNOSTICS,
  null_ls.methods.DIAGNOSTICS_ON_OPEN,
  null_ls.methods.DIAGNOSTICS_ON_SAVE,
}

local linter_list_registered = function(filetype)
  local registered_providers = list_registered_providers_names(filetype)
  local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
    return registered_providers[m] or {}
  end, alternative_methods))

  return providers_for_methods
end
-- end for lsp

local lsp_info = {
  function()
    --local msg = "No Active Lsp"
    local msg = "LS Inactive"
    -- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local buf_ft = vim.bo.filetype
    local clients = vim.lsp.get_active_clients()
    -- start register
    local buf_clients = vim.lsp.buf_get_clients()
    local buf_client_names = {}
    if next(buf_clients) == nil then
      -- TODO: clean up this if statement
      if type(msg) == "boolean" or #msg == 0 then
        return "LS Inactive"
      end
      return msg
    end
    -- add client
    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" and client.name ~= "copilot" then
        table.insert(buf_client_names, client.name)
      end
    end
    -- add formatter
    local supported_formatters = list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_formatters)
    -- add linter
    local supported_linters = linter_list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_linters)
    -- decomple
    local unique_client_names = vim.fn.uniq(buf_client_names)
    local mesg = table.concat(unique_client_names, ", ")
    return mesg
  end,
  --icon = " ",
  icon = "",
}

local function modified()
  if vim.bo.modified then
    return "+"
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return "-"
  end
  return ""
end

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("lazyvim.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            -- {
            --   function()
            --     return Util.root.pretty_path()
            --   end,
            -- },
            { "filename", file_status = false, path = 1 },
            { modified, color = { bg = colors.red } },
          },
          lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = Util.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
          },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = Util.ui.fg("Special"),
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "filetype", icons_enabled = true, separator = "", padding = { left = 1, right = 0 } },
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
