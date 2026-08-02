local default_opts = require "nvchad.configs.nvimtree"

default_opts.filesystem_watchers = {
    enable = true,
    ignore_dirs = {
        "node_modules",
        ".git",
    },
}

default_opts.on_attach = function(bufnr)
    local api = require "nvim-tree.api"

    -- 1. Load all standard nvim-tree keys first (g?, l, h, v, etc.)
    api.config.mappings.default_on_attach(bufnr)

    -- 2. Helper function to extract the directory path under your cursor
    local function get_target_dir()
        local node = api.tree.get_node_under_cursor()
        if not node or node.name == ".." then
            return nil
        end
        -- If cursor is on a file, grab its folder; otherwise use the directory path
        return node.type == "directory" and node.absolute_path or vim.fs.dirname(node.absolute_path)
    end

    -- 3. Define the keymaps (Only active when your cursor is inside the NvimTree window)
    vim.keymap.set("n", "<leader>ff", function()
        local path = get_target_dir()
        if path then
            require("telescope.builtin").find_files { cwd = path }
        end
    end, { buffer = bufnr, nowait = true, silent = true, desc = "Telescope Find Files in Focused Dir" })

    vim.keymap.set("n", "<leader>fw", function()
        local path = get_target_dir()
        if path then
            require("telescope.builtin").live_grep {
                search_dirs = { path },
                additional_args = function()
                    return { "--fixed-strings" }
                end,
            }
        end
    end, { buffer = bufnr, nowait = true, silent = true, desc = "Telescope Live Grep in Focused Dir" })

    vim.keymap.set("n", "<leader>fW", function()
        local path = get_target_dir()
        if path then
            require("telescope.builtin").live_grep { search_dirs = { path } }
        end
    end, { buffer = bufnr, nowait = true, silent = true, desc = "Telescope Live Grep in Focused Dir (Regex)" })
end

return default_opts
