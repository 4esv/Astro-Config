--[[
 ▄▄▄       ██████ ▄▄▄█████▓ ██▀███   ▒█████   ▄████▄   ▒█████   ███▄ ▄███▓ ███▄ ▄███▓
▒████▄   ▒██    ▒ ▓  ██▒ ▓▒▓██ ▒ ██▒▒██▒  ██▒▒██▀ ▀█  ▒██▒  ██▒▓██▒▀█▀ ██▒▓██▒▀█▀ ██▒
▒██  ▀█▄ ░ ▓██▄   ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██░  ██▒▒▓█    ▄ ▒██░  ██▒▓██    ▓██░▓██    ▓██░
░██▄▄▄▄██  ▒   ██▒░ ▓██▓ ░ ▒██▀▀█▄  ▒██   ██░▒▓▓▄ ▄██▒▒██   ██░▒██    ▒██ ▒██    ▒██ 
 ▓█   ▓██▒██████▒▒  ▒██▒ ░ ░██▓ ▒██▒░ ████▓▒░▒ ▓███▀ ░░ ████▓▒░▒██▒   ░██▒▒██▒   ░██▒
 ▒▒   ▓▒█▒ ▒▓▒ ▒ ░  ▒ ░░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒░   ░  ░░ ▒░   ░  ░
  ▒   ▒▒ ░ ░▒  ░ ░    ░      ░▒ ░ ▒░  ░ ▒ ▒░   ░  ▒     ░ ▒ ▒░ ░  ░      ░░  ░      ░
  ░   ▒  ░  ░  ░    ░        ░░   ░ ░ ░ ░ ▒  ░        ░ ░ ░ ▒  ░      ░   ░      ░   
      ░  ░     ░              ░         ░ ░  ░ ░          ░ ░         ░          ░   
                                           ░                                          
]]

----------------------------------------
-- [ ASTROCOMMUNITY CONFIGURATION ]
----------------------------------------
-- This configuration is loaded before any plugins in the `plugins/` directory
-- to ensure proper spec processing order and dependency resolution.
--
-- ⚡ PERFORMANCE NOTE:
-- This file is imported in `lazy_setup.lua` and processes before user plugins
-- to maintain load order consistency and prevent conflicts.

---@type LazySpec
return {
    -- 🚀 Core Community Package
    "AstroNvim/astrocommunity",

    -- 🎨 Visual Enhancements
    { import = "astrocommunity.color.twilight-nvim" },    -- Dynamic background dimming
    { import = "astrocommunity.color.modes-nvim" },       -- Color-coded editing modes
    
    -- 🔄 Motion & Navigation
    { import = "astrocommunity.motion.hop-nvim" },        -- Lightning-fast cursor movement
    
    -- 🛠️ Language Support
    { import = "astrocommunity.pack.lua" },               -- Enhanced Lua development
    
    -- 🌈 Colorscheme Collection
    -- Each theme carefully selected for optimal coding experience
    { import = "astrocommunity.colorscheme.oldworld-nvim" },      -- Vintage aesthetic
    { import = "astrocommunity.colorscheme.modus-nvim" },         -- High contrast & accessibility
    { import = "astrocommunity.colorscheme.bluloco-nvim" },       -- Modern & vibrant
    { import = "astrocommunity.colorscheme.cyberdream-nvim" },    -- Cyberpunk-inspired
    { import = "astrocommunity.colorscheme.github-nvim-theme" },  -- GitHub-style
    { import = "astrocommunity.colorscheme.kanagawa-nvim" },      -- Japanese art inspired
    { import = "astrocommunity.colorscheme.citruszest-nvim" },    -- Fresh & energetic
    
    -- 🌐 Web Development
    { import = "astrocommunity.programming-language-support.web-tools-nvim" },
    
    -- 🤖 AI Assistance
    { import = "astrocommunity.completion.codeium-nvim" }, -- AI-powered code completion
}
