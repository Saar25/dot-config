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

map("x", "v", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, { desc = "Selection increment " })

-- 3. SHRINK SELECTION with 'V' (Shift+v) in Visual Mode
map("x", "V", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, { desc = "Selection decrement" })

map("n", "<leader>fm", function()
    -- 1. Format the file using conform
    require("conform").format({ lsp_fallback = true, async = false }, function(err)
        if err then
            return
        end

        -- 2. Clean up unused imports via LSP once formatting finishes
        vim.lsp.buf.code_action {
            context = {
                only = { "source.removeUnusedImports" },
            },
            apply = true,
        }
    end)
end, { desc = "Format file and remove unused imports" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- overwriting the same lines in NvChad mapping file, in order to add `async = true`
-- map("n", "<leader>fm", function()
--   require("conform").format({ async = true, lsp_fallback = true })
-- end, { desc = "custom format files" })
