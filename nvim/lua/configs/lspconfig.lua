require("nvchad.configs.lspconfig").defaults()

vim.lsp.config["ts_ls"] = {
    -- shouldn't do this, its only because our project doesn't have tsconfig in its packages, should just add one that extends root base
    root_dir = function(bufnr, on_dir)
        local root_markers = {
            "tsconfig.ts",
            "tsconfig.json",
            ".git",
            "package.json",
        }

        local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

        if project_root then
            on_dir(project_root)
        end
    end,
}

local servers = { "html", "cssls", "ts_ls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
