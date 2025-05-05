--[[
==============================
🎨 Colorscheme Index Guide
==============================
(1) tokyonight  
    Flavors: 
      (1) storm  
      (2) night  
      (3) moon  
      (4) day (light)

(2) catppuccin  
    Flavors: 
      (1) latte  (light)
      (2) frappe  
      (3) macchiato  
      (4) mocha

(3) kanagawa  
    Flavors: 
      (1) wave  
      (2) dragon  
      (3) lotus (light)

(4) rose-pine  
    Flavors: 
      (1) main  
      (2) moon  
      (3) dawn (light)
==============================
Set `colorscheme_index` and `flavor_index` below to change theme.
]]

-- === Theme Selector ===
local colorscheme_index = 3
local flavor_index = 2

-- Themes and their available flavors
local themes = {
  {
    name = "tokyonight",
    plugin = "folke/tokyonight.nvim",
    flavors = { "storm", "night", "moon", "day" },
    setup = function(flavor)
      vim.g.tokyonight_style = flavor
    end,
  },
  {
    name = "catppuccin",
    plugin = "catppuccin/nvim",
    flavors = { "latte", "frappe", "macchiato", "mocha" },
    setup = function(flavor)
      require("catppuccin").setup({ flavour = flavor })
    end,
  },
  {
    name = "kanagawa",
    plugin = "rebelot/kanagawa.nvim",
    flavors = { "wave", "dragon", "lotus" },
    setup = function(flavor)
      require("kanagawa").setup({ theme = flavor })
    end,
  },
  {
    name = "rose-pine",
    plugin = "rose-pine/neovim",
    flavors = { "main", "moon", "dawn" },
    setup = function(flavor)
      require("rose-pine").setup({ variant = flavor })
    end,
  },
}

-- Pick selected theme and flavor
local selected = themes[colorscheme_index]
local selected_flavor = selected.flavors[flavor_index]

-- === Plugin Setup ===
return {
  {
    selected.plugin,
    name = selected.name,
    lazy = false,
    priority = 1000,
    config = function()
      if selected.setup then
        selected.setup(selected_flavor)
      end
      vim.cmd("colorscheme " .. selected.name)
    end,
  },
}

