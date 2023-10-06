-- dailywriter.nvim/lua/init.lua
M = {}

function M.word_count()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local count = 0
    for _, line in ipairs(lines) do
        count = count + #vim.fn.split(line, '\\W\\+')
    end
    vim.api.nvim_out_write(count .. ' words\n')
end

function M.open_today()
    local dir = vim.fn.expand('~/writing/')
    vim.fn.mkdir(dir, 'p') -- Ensure the ~/writing/ directory exists
    local file = dir .. os.date('%Y-%m-%d') .. '.txt'
    vim.api.nvim_command('edit ' .. file)
    vim.o.wrap = true
    vim.o.linebreak = true
end

function M.list_past()
    local dir = vim.fn.expand('~/writing/')
    require 'telescope.builtin'.find_files({
        prompt_title = '< Past Writings >',
        cwd = dir,
        layout_strategy = 'horizontal',
        layout_config = {
            preview_width = 0.5,
        },
    })
end

function M.git_sync()
    -- Store the current working directory
    local original_dir = vim.fn.getcwd()

    -- Change to the target directory
    local target_dir = vim.fn.expand('~/writing')
    vim.api.nvim_command('cd ' .. target_dir)

    -- Construct the commit message
    local commit_msg = "Daily writing sync: " .. os.date('%Y-%m-%d %H:%M:%S')

    -- Execute vim-fugitive commands
    vim.api.nvim_command("Git add .")
    vim.api.nvim_command("G commit -m '" .. commit_msg .. "'")
    vim.api.nvim_command("G push")

    -- Restore the original working directory
    vim.api.nvim_command('cd ' .. original_dir)
end

return M
