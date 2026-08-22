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

return {
    lazygit_terminal = Terminal:new(term_opts "lazygit"),
    lazydocker_terminal = Terminal:new(term_opts "lazydocker"),
}
