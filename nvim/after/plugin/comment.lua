vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  callback = function()
    vim.opt.formatoptions:remove("o")
  end
})
