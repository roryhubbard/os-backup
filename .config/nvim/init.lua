-- Leader/local leader - lazy.nvim needs these set first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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

require('lazy').setup('plugins', {
  defaults = { lazy = true },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
--        'gzip',
--        'matchit',
--        'matchparen',
--        'netrwPlugin',
--        'rplugin',
--        'tarPlugin',
--        'tohtml',
--        'tutor',
--        'zipPlugin',
      },
    },
  },
})

require "remap"
require "set"
