local default_opts = require "nvchad.configs.nvimtree"

default_opts.filesystem_watchers = {
    enable = true,
    ignore_dirs = {
        "node_modules",
        ".git",
    },
}

return default_opts
