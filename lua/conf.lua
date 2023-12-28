require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "lua", "vue", "html", "javascript", "tsx", "vim", "vimdoc", "typescript", "css", "scss",
                        "bash", "json", "xml", "query"},
    matchup = {
        enable = true
    },
    highlight = {
        enable = false
    }
    -- autotag = {
    --     enable = true,
    --     enable_rename = true,
    --     enable_close = true,
    --     enable_close_on_slash = true,
    --     filetypes = {"html", "xml", "vue", "tsx"}
    -- },
}

require('nvim-ts-autotag').setup()

-- leap config
require('leap').add_default_mappings()
-- Disable auto jump first match
require('leap').opts.safe_labels = {}
require('leap').opts.highlight_unlabeled_phase_one_targets = true
-- 恢复 x
vim.keymap.del({'x', 'o'}, 'x')
vim.keymap.del({'x', 'o'}, 'X')
-- vim.keymap.set({'x', 'o', 'n'}, 'r', '<Plug>(leap-forward-to)')
-- vim.keymap.set({'x', 'o', 'n'}, 'R', '<Plug>(leap-backward-to)')

-- flit config
require('flit').setup {
    keys = {
        f = 'f',
        F = 'F',
        t = 't',
        T = 'T'
    },
    -- A string like "nv", "nvo", "o", etc.
    labeled_modes = "o",
    multiline = true,
    opts = {}
}

-- if not vim.fn.has('win32') then
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- end
