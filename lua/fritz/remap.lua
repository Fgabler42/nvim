vim.g.mapleader = " "

-----------ALL-LEADER-----------------------
vim.keymap.set("n", "<leader>pv", function() vim.cmd("Ex") end)
vim.keymap.set("n", "<leader>h", function() vim.cmd("Std") end)
--vim.keymap.set("n", "<leader>vwm", function() require("vim-with-me").StartVimWithMe() end)
--vim.keymap.set("n", "<leader>svwm", function() require("vim-with-me").StopVimWithMe() end)
vim.keymap.set("n", "<leader>l", ":")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end)
vim.keymap.set('n', '<leader>k', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Change word under cursor' })
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>s", function() vim.cmd("suspend") end)


vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Define a key mapping for copying without losing buffer contents
vim.api.nvim_set_keymap('v', '<Leader>y', '<Cmd>lua CopyWithoutLosing()<CR>', { noremap = true, silent = true })

function CopyWithoutLosing()
    -- Save the current line into a variable
    local saved_line = vim.api.nvim_buf_get_lines(0, vim.fn.line('.') - 1, vim.fn.line('.'), false)[1]

    -- Copy the selected text
    vim.cmd('normal! y')

    -- Restore the original line into the buffer
    vim.api.nvim_buf_set_lines(0, vim.fn.line('.') - 1, vim.fn.line('.'), false, { saved_line })
end
