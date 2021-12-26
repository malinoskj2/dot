-- Cmp

local lspkind = require "lspkind"
local cmp = require "cmp"

cmp.setup {
  -- Mapping
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    -- Tab Completion
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },

  -- Sources (priority determined by order)
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 5 },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "luasnip" },
  },

  -- Snippet
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  -- Formatting
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      maxwidth = 50,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      }
    })
  },

  -- Documentation
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },

  -- Experimental
  experimental = {
    native_menu = false, 
    ghost_text = true
  } 
}

-- Launch mappings
vim.api.nvim_set_keymap(
  'n', 
  '<Leader>f', 
  "<CMD>lua require'jesse.plugin.cmp'.git_or_find_files()<CR>",
  { noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
  'n', 
  '<Leader>g', 
  "<CMD>lua require('telescope.builtin').live_grep()<cr>",
  { noremap = true, silent = true}
)

-- Fallback to find_files if not in git repo
return {
  git_or_find_files = function()
    local opts = {}
    local ok = pcall(require"telescope.builtin".git_files, opts)
    if not ok then require"telescope.builtin".find_files(opts) end
  end
}

