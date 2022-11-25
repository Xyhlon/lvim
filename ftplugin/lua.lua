local status_ok, neodev = pcall(require, "neodev")
if not status_ok then
  vim.cmd [[ packadd neodev.nvim ]]
  neodev = require "neodev"
end

local luadev = neodev.setup {
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    -- plugins = false, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    plugins = { "neodev.nvim", "plenary.nvim" },
  },
  -- runtime_path = true,
  lspconfig = {
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "lvim" },
        },
        completion = {
          callSnippet = "Replace"
        }
        ,
        workspace = {
          library = {
            [require("lvim.utils").join_paths(get_runtime_dir(), "lvim", "lua")] = true,
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  },
}
require("lvim.lsp.manager").setup("sumneko_lua", luadev)
