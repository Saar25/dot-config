require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", {
    desc = "CMD enter command mode",
})

map("i", "jk", "<ESC>")

map("n", "<leader>e", ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', {
    desc = "Show error",
})

map("n", "<leader>mp", ":MarkdownPreview<CR>", {
    desc = "Markdown Preview",
})

map("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", {
    desc = "telescope find references",
    noremap = true,
    silent = true,
})

map("n", "<leader>ad", "<cmd>Noice dismiss<CR>", {
    desc = "noice dismiss",
    noremap = true,
    silent = true,
})

map("n", "<leader>fW", function()
    require("telescope.builtin").live_grep()
end, { desc = "Telescope Live Grep" })

map("n", "<leader>fw", function()
    require("telescope.builtin").live_grep {
        additional_args = function()
            return { "--fixed-strings" }
        end,
    }
end, { desc = "Telescope Live Grep" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- overwriting the same lines in NvChad mapping file, in order to add `async = true`
-- map("n", "<leader>fm", function()
--   require("conform").format({ async = true, lsp_fallback = true })
-- end, { desc = "custom format files" })
