local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'lua_ls',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').ccls.setup{
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
		vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
		vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer = 0})
		vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer = 0})
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
	end,
}

require('lspconfig').julials.setup{
    capabilities = capabilities,
	on_attach = function()
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
		vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
		vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer = 0})
		vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer = 0})
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
	end,
}

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
