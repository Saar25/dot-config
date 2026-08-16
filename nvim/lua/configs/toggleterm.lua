require("toggleterm").setup()

local Terminal = require("toggleterm.terminal").Terminal

local function term_opts(cmd)
    return {
        cmd = cmd,
        direction = "float",
        hidden = true,
        float_opts = {
            border = "curved",
        },
        on_open = function(term)
            vim.cmd "startinsert!"
            vim.keymap.set(
                "t",
                "<M-q>",
                "<cmd>close<CR>",
                { buffer = term.bufnr, nowait = true, noremap = true, silent = true }
            )
        end,
    }
end

local lazygit = Terminal:new(term_opts "lazygit")
local lazydocker = Terminal:new(term_opts "lazydocker")

vim.keymap.set({ "n", "t" }, "<leader>lg", function()
    lazygit:toggle()
end, { desc = "Toggle Persistent Lazygit" })

vim.keymap.set({ "n", "t" }, "<leader>ld", function()
    lazydocker:toggle()
end, { desc = "Toggle Persistent Lazydocker" })
