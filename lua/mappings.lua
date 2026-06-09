require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>", { desc = "Show error" })
map("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown Preview" })
map('n', '<leader>fr', '<cmd>Telescope lsp_references<CR>', { desc = "telescope find references", noremap=true, silent=true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- overwriting the same lines in NvChad mapping file, in order to add `async = true`
-- map("n", "<leader>fm", function()
--   require("conform").format({ async = true, lsp_fallback = true })
-- end, { desc = "custom format files" })
