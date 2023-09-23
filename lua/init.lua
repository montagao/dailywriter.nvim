-- dailywriter.nvim/lua/init.lua
M = {}

function M.word_count()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local count = 0
    for _, line in ipairs(lines) do
        count = count + #vim.fn.split(line, '\\W\\+')
    end
    print(count .. ' words')
end

function M.open_today()
    local dir = vim.fn.expand('~/writing/') .. os.date('%Y-%m-%d')
    vim.fn.mkdir(dir, 'p')
    local file = dir .. '/writing.txt'
    vim.api.nvim_command('edit ' .. file)
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
    vim.api.nvim_command("Gwrite")
    vim.api.nvim_command("Gcommit -m '" .. commit_msg .. "'")
    vim.api.nvim_command("Gpush")

    -- Restore the original working directory
    vim.api.nvim_command
end

return M
