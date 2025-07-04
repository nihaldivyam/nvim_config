vim.cmd("set expandtab")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set tabstop=2")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugin setup
local plugins = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup()
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim"
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<space>fd', builtin.find_files, {})
    end
  }
}

require("lazy").setup(plugins, {})
