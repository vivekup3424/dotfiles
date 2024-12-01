-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--auto-run python files on save
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.py',
  command = ':!python3 %',
})

-- NOTE: Another attempt using command from claude

-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = '*.py',
--   desc = 'Auto-run Python files on save',
--   group = vim.api.nvim_create_augroup('python-autorun', { clear = true }),
--   callback = function()
--     local filename = vim.fn.expand '%'
--     local output = vim.fn.system('python3 ' .. filename)
--     -- Remove trailing newlines and limit output length
--     output = output:gsub('^%s+', ''):gsub('%s+$', '')
--     output = string.sub(output, 1, 100) -- Limit to 100 characters
--     if output ~= '' then
--       -- If there's an error, it will be in stderr
--       if vim.v.shell_error ~= 0 then
--         vim.notify('Python Error: ' .. output, vim.log.levels.ERROR)
--       else
--         -- Show output in status line
--         vim.api.nvim_echo({ { output, 'Normal' } }, false, {})
--       end
--     end
--   end,
-- })
