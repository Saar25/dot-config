return {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden", -- This flag tells ripgrep to search dotfiles
        },
        -- Ensure .git folders are ignored so you don't grep through git history
        file_ignore_patterns = { "node_modules", ".git/" },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
}
