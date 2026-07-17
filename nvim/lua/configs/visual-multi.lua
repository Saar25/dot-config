-- Enable mouse support (Ctrl + Left Click adds a cursor)
vim.g.VM_mouse_mappings = 1

-- Clear default mappings entirely to avoid plugin conflicts
vim.g.VM_default_mappings = 0

-- Allow adding a cursor at position without mapping collisions
vim.g.VM_add_cursor_at_pos_no_mapping = 1

-- Would have wanted to put these on mappings.lua but this isn't possible to my understanding
vim.g.VM_maps = {
    ["Find Under"] = "<A-j>",
    ["Find Subword Under"] = "<A-j>",
    ["Select All"] = "<C-A-S-J>",
    ["Skip Region"] = "<A-S-J>",
    ["Exit"] = "<Esc>",
}

vim.keymap.set("x", "<A-j>", "<Plug>(VM-Visual-Find-Under)", { desc = "VM Find under selection" })
vim.keymap.set("x", "<C-A-S-j>", "<Plug>(VM-Visual-Select-All)", { desc = "VM Select all" })
