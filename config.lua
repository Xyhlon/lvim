--[[

stack traceback:
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
vim.opt.termguicolors = true
lvim.auto_complete = true
lvim.auto_close_tree = 0
lvim.wrap_lines = false
lvim.timeoutlen = 100
lvim.ignore_case = true
lvim.smart_case = true
-- lvim.lang.lua.formatters = { { exe = "stylua" } }

lvim.lsp.installer.setup.automatic_installation = true
-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
--O.plugin.colorizer.active = false
--O.plugin.ts_playground.active = false
-- vim.cmd [[ let g:clipboard = { 'name' : 'wslclipboard', 'copy' : {'+': '/mnt/c/usr/local/bin/win32yank.exe -i --crlf', '*': '/mnt/c/usr/local/bin/win32yank.exe -i --crlf', }, 'paste' : { '+': '/mnt/c/usr/local/bin/win32yank.exe -o --lf', '*': '/mnt/c/usr/local/bin/win32yank.exe -o --lf', }, 'cache_enabled':1, } ]]
vim.cmd "let g:vimtex_compiler_progname = 'nvr'"
vim.g.vimtex_view_method = "zathura"

-- LATEX Stuff
-- vim.cmd [[let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell']]
vim.opt.spell = true
vim.opt.spelllang = "en_us,de"
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.g.latexfmt_no_join_any = { "%", "\\begin", "\\end", "\\vspace", "\\noindent" }
vim.g.latexfmt_no_join_prev = { "\\item" }
vim.g.latexfmt_verbatim_envs = { "align" }

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" }, args = { "--fast" } },
  {
    exe = "prettier",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
  { exe = "stylua", filetypes = { "lua" } },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { exe = "black" },
  { exe = "flake8", filetypes = { "python" } },
  { exe = "luacheck", filetypes = { "lua" } },
  -- {
  --   exe = "eslint_d",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "javascriptreact" },
  -- },
}

vim.cmd [[
    autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
    autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>]]
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "oceanic_material"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.insert_mode["kj"] = "<ESC>"
-- lvim.keys[""]
-- local vsc_launch = require "dap.ext.vscode"
-- vsc_launch.load_launchjs()

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.comment.active = true
lvim.builtin.dap.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.bufferline.active = true
lvim.builtin.lua_dev = { active = true }

-- if you don't want all the parsers change this to a table of the ones you want
-- local dap_install = require "dap-install"
-- local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

-- for _, debugger in ipairs(dbg_list) do
--   dap_install.config(debugger)
-- end

function P(value)
  print(vim.inspect(value))
  return value
end

-- local dap = require('dap')
-- dap.adapters.c = {
--   type = "executable",
--   command = "/usr/bin/lldb-vscode-10", -- adjust as needed
--   name = "lldb",
-- }

-- lvim.builtin.cmp.sources = {}

-- Whichkey
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings.T.h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" }
lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }
lvim.builtin.which_key.mappings.s.M = { "<cmd>Telescope man_pages sections=1,2,3,3p,4,5,6,7,8,9,<cr>", "Man Pages" }
-- lvim.builtin.which_key.mappings.k = { "<cmd>Tabularize '<,'>", "Man Pages" }
lvim.keys.visual_mode["Q"] = ":Tabularize /& <CR>"
-- Treesitter
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Telescope
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
-- end

-- vim.lsp.set_log_level "trace"
-- if vim.fn.has "nvim-0.5.1" == 1 then
--   require("vim.lsp.log").set_format_func(vim.inspect)
-- end
-- generic LSP settings
lvim.plugins = {
  { "theniceboy/nvim-deus" },
  { "terryma/vim-multiple-cursors" },
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  { "godlygeek/tabular" },
  { "engeljh/vim-latexfmt" },
  { "cdelledonne/vim-cmake" },
  { "folke/lua-dev.nvim" },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  { "lervag/vimtex" },
  { "NTBBloodbath/doom-one.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  { "stevearc/vim-arduino" },
  { "glepnir/oceanic-material" },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },
  -- {
  -- 	"lewis6991/gitsigns.nvim",
  -- 	config = function()
  -- 		require("gitsigns").setup()
  -- 	end,
  -- 	requires = "nvim-lua/plenary.nvim",
  -- },
}

if lvim.builtin.dap.active then
  require("user.dap").config()
end
-- cmd = {
--     "arduino-language-server",
--     "-cli-config",
--     "~/.arduino15/arduino-cli.yaml",
--     "-cli",
--     "arduino-cli",
--     "-clangd",
--     "clangd",
--     "-fqbn",
--     "arduino:avr:uno",
--   }
-- require("nvim-lsp-installer").setup {}
-- local lspconfig = require "lspconfig"
-- lspconfig.arduino_language_server.setup {
--   cmd = {
--     -- Required
--     "arduino-language-server",
--     "-cli-config",
--     "~/.arduino15/arduino-cli.yaml",
--     -- Optional
--     "-cli",
--     "/usr/bin/arduino-cli",
--     "-clangd",
--     "/usr/bin/clangd",

--     "-fqbn",
--     "arduino:avr:uno",
--   },

--   -- root_dir = lspconfig.util.find_git_ancestor,
--   root_dir = function(fname)
--     -- P(vim.fn.expand "%:p:h")
--     return vim.fn.expand "%:p:h"
--     -- local root_files = { vim.fn.expand "%" }
--     -- P(fname)
--     -- P(root_files)
--     -- local primary = lspconfig.util.root_pattern(unpack(root_files))(fname)-
--     -- P(primary)
--     -- return primary
--   end,
--   filetypes = { "arduino", "ino" },
-- }
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/onedarker.nvim
-- - /home/bob/.local/share/lunarvim/site/pack/packer/opt/playground
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/vimtex
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/vim-cmake
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/vim-repeat
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/nvim-deus
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/vim-latexfmt
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/nvim-colorizer.lua
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/vim-arduino
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/oceanic-material
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/tabular
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/vim-surround
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/doom-one.nvim
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/nvim-lsp-installer
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/vim-multiple-cursors
-- - /home/bob/.local/share/lunarvim/site/pack/packer/start/nvim-dap-virtual-text
