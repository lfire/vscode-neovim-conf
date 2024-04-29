-- vim script 中的 cursorMove 不支持 select 参数
-- 所以这里通过lua脚本，同样调用 cursorMove，但是可以传递 select 参数
-- !但仍然存在问题：
-- 1. cursorMove 会破坏 visual line 模式，所以 visual line 模式只会保留一次，然后就会变成 visual 模式
-- 2. 文档中存在有中文时，移动过程中，col 会出现偏移，导致选区不准确
-- local vim_api = vim.api
-- 行内移动
local function moveInLine(d)
    require('vscode-neovim').action('cursorMove', {
        args = {{
            to = d == 'end' and 'wrappedLineEnd' or 'wrappedLineStart',
            by = 'wrappedLine',
            -- by = 'line',
            -- value = vim.v.count1,
            -- value = vim.v.count,
            value = 0,
            select = true
        }}
    })
    return '<Ignore>'
end

-- 行间移动
local function moveLine(d)
    -- local current_mode = vim.api.nvim_get_mode().mode
    require('vscode-neovim').action('cursorMove', {
        args = {{
            to = d == 'j' and 'down' or 'up',
            by = 'wrappedLine',
            -- by = 'line',
            value = vim.v.count1,
            -- value = vim.v.count,
            select = true
        }}
        -- not work
        -- callback = function()
        --     -- cb()
        --     if current_mode == 'V' then
        --         vim.schedule(function()
        --             vim_api.nvim_input('V')
        --         end)
        --         -- vim_api.nvim_input('V')
        --         -- vim_api.nvim_feedkeys('V', 'x', false)
        --         -- vim_api.nvim_feedkeys('V', 'v', true)
        --         -- debug.debug()
        --         -- return 'V'
        --     end
        --     -- return '<Ignore>'
        -- end
    })
    return '<Ignore>'
end

local function move(d)
    return function()
        -- 获取当前编辑模式
        local current_mode = vim.api.nvim_get_mode().mode

        -- 获取当前选区的标记的位置（<）
        local start_pos = vim.api.nvim_buf_get_mark(0, "<")
        local end_pos = vim.api.nvim_buf_get_mark(0, ">")
        -- 提取列号 和 行号
        local start_line = start_pos[1]
        local start_col = start_pos[2]
        local end_line = end_pos[1]
        local end_col = end_pos[2]

        -- 获取光标当前列号
        -- local cursor_col = vim.fn.col('.')
        -- 获取当前行最大列号
        -- local line_end_col = vim.fn.col('$')
        -- 获取选区的结束行文本内容
        local selected_end_line_text = vim.fn.getline(end_line)
        -- 获取当前光标位置的行号和列号
        -- 参数 0 表示当前窗口
        local cursor = vim.api.nvim_win_get_cursor(0)
        -- 提取行号
        local current_line = cursor[1]
        local cur_end_dist = math.abs(current_line - end_line)
        local cur_start_dist = math.abs(current_line - start_line)

        -- 因为 moveCursor 会破坏 visual line 模式，所以 visual line 模式只会保留一次，然后就会变成 visual 模式
        -- 因此这段逻辑在一次选区的动作中只会执行一次
        if current_mode == 'V' then
            if cur_end_dist > cur_start_dist then
                vim.api.nvim_feedkeys('0', 'V', false)
                moveLine(d)
                moveInLine('start')
            end
            if cur_end_dist < cur_start_dist then
                vim.api.nvim_feedkeys('$', 'V', false)
                moveLine(d)
                moveInLine('end')
            end
            if cur_end_dist == cur_start_dist then
                moveLine(d)
                if d == 'j' then
                    moveInLine('end')
                else
                    moveInLine('start')
                end
            end
        else

            -- 基本动作，移动一行
            moveLine(d)

            -- 实现模拟 visual line 的效果
            if start_col == 0 and (end_col + 1 == #selected_end_line_text or end_col == 2147483647) then
                -- -- 单行选区
                -- if start_line == end_line then
                --     if d == 'j' then
                --         moveInLine('end')
                --     else
                --         moveInLine('start')
                --     end
                --     vim.api.nvim_feedkeys('V', 'v', false)
                --     return '<Ignore>'
                -- end

                -- k方向，向上移动
                -- 如果选区的结束行行内容被全选中，那么在执行完行间移动后，就将新行的光标移动到行尾
                -- 实现模拟 visual line 的效果
                if cur_end_dist > cur_start_dist then
                    moveInLine('start')
                    -- return 'V'
                    return '<Ignore>'
                end
                -- j方向，向下移动
                -- 如果选区的开始行行内容被全选中，那么在执行完行间移动后，就将新行的光标移动到行首
                -- 实现模拟 visual line 的效果
                if cur_end_dist < cur_start_dist then
                    moveInLine('end')
                    -- return 'V'
                    return '<Ignore>'
                end
                -- 移动到单行选区场景
                if cur_end_dist == cur_start_dist then
                    if d == 'j' then
                        moveInLine('end')
                    else
                        moveInLine('start')
                    end
                    vim.api.nvim_feedkeys('V', 'v', false)
                    return '<Ignore>'
                end
            end
        end
        return '<Ignore>'
    end
end

vim.keymap.set('v', 'gj', move('j'), {
    expr = true,
    noremap = true,
    silent = true
})
vim.keymap.set('v', 'gk', move('k'), {
    expr = true,
    noremap = true,
    silent = true
})

local function moveCursor(d)
    return function()
        -- 当 v.count 为 0 时，表示没有使用数字修饰符，此时可以执行自定义的移动
        -- 否则，执行原生的移动，如 10j
        if (vim.v.count == 0 and vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '') then
            return 'g' .. d
        else
            return d
        end
    end
end

-- 依赖于 gj 和 gk 的定义，所以要放在 gj 和 gk 的后面
vim.keymap.set('', 'k', moveCursor('k'), {
    expr = true,
    remap = true,
    silent = true
})
vim.keymap.set('', 'j', moveCursor('j'), {
    expr = true,
    remap = true,
    silent = true
})

local function moveViewPort(p)
    return function()
        require('vscode-neovim').action('cursorMove', {
            args = {{
                to = p,
                by = 'wrappedLine',
                -- by = 'line'
                -- value = vim.v.count1,
                -- value = vim.v.count,
                -- value = d == 'viewPortBottom' and 3 or 1
                value = 2
                -- select = true
            }}
        })
        return '<Ignore>'
    end
end

-- viewPortTop viewPortBottom viewPortCenter
vim.keymap.set('', 'H', moveViewPort('viewPortTop'), {
    expr = true,
    noremap = true,
    silent = true
})
vim.keymap.set('', 'L', moveViewPort('viewPortBottom'), {
    expr = true,
    noremap = true,
    silent = true
})
vim.keymap.set('', 'M', moveViewPort('viewPortCenter'), {
    expr = true,
    noremap = true,
    silent = true
})
