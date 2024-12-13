---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local dashboard = require "alpha.themes.dashboard"

      -- helper function for utf8 chars
      local function getCharLen(s, pos)
        local byte = string.byte(s, pos)
        if not byte then return nil end
        return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
      end

      local function applyColors(logo, colors, logoColors)
        dashboard.section.header.val = logo

        for key, color in pairs(colors) do
          local name = "Alpha" .. key
          vim.api.nvim_set_hl(0, name, color)
          colors[key] = name
        end

        dashboard.section.header.opts.hl = {}
        for i, line in ipairs(logoColors) do
          local highlights = {}
          local pos = 0

          for j = 1, #line do
            local opos = pos
            pos = pos + getCharLen(logo[i], opos + 1)

            local color_name = colors[line:sub(j, j)]
            if color_name then table.insert(highlights, { color_name, opos, pos }) end
          end

          table.insert(dashboard.section.header.opts.hl, highlights)
        end
        return dashboard.opts
      end

      require("alpha").setup(applyColors({
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢴⠊⣉⣉⠉⠉⠉⠙⢦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠐⢿⣿⣿⣦⡀⠀⠀⠀⠱⢄⠀⠀⠀⠀⡄⠶⠛⠙⠛⠉⠒⠤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠃⠀⠀⠀⢀⣈⣅⣤⡤⠶⠒⠛⠛⠳⢯⡷⠶⢶⣾⣷⣆⠀⠀⠀⠈⢧⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡶⠶⠚⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠘⢷⡄⠀⠉⠉⠙⠷⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾⠛⠀⠀⠀⠀⠀⠀⠀⡀⠀⠄⠃⠀⠀⠄⠀⠀⠻⢧⡀⠀⠀⠀⠀⠀⠀⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⠁⠀⠀⠀⠀⠂⠈⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠄⠀⠀⠉⠳⢦⣄⡀⠀⠀⢰⣼⠀⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠃⠀⡐⠀⠀⠁⠀⠄⠀⠀⢀⠈⠀⠀⠄⠀⠀⡀⠀⠀⠂⢀⠀⠀⠉⠉⠛⠳⠛⠻⣄⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⡀⠠⠀⠁⠠⠀⠀⠀⠀⠀⢀⠀⠀⠀⠂⠀⠀⠠⠀⢀⠀⠂⡀⠐⠀⠤⢠⡁⠚⢷⣄⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⢀⠀⠐⠀⠀⠀⠀⠄⠀⠀⠀⠀⠂⠀⡀⠂⠠⠐⠀⠄⠂⢀⠊⠀⣃⢦⢡⠉⠄⠛⣧⡀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠈⠀⠀⠀⠀⠀⢀⠀⠀⠄⠀⠁⡀⠐⡀⣀⠁⢠⢡⡌⣀⢆⡄⡌⡰⣈⠆⣻⠜⡂⠑⠬⢿⡆⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⢃⣀⠀⠠⠀⠀⠄⠀⡀⠠⣀⢐⡈⣠⣄⢦⡵⢴⠮⠿⢶⠿⣾⣿⣶⣝⣷⣑⢪⡕⣏⡒⠈⢈⣹⣧⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⢻⣿⣿⣷⣿⡶⠿⠾⠓⠚⠋⠉⠁⠈⣀⠤⣄⣆⢳⡬⡶⢤⢠⢉⠋⠻⣽⢦⣹⣿⢡⠂⠀⢼⣿⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀⠀⠀⠀⠀⠀⠀⣀⢶⣰⠾⣶⣷⡾⢿⣾⣸⢷⣹⢿⣿⢷⡏⣰⠀⡀⠰⠈⠱⠀⢀⠸⣾⢿⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢶⣦⣜⣦⣻⣞⣷⣯⣶⣷⣿⣷⣿⣾⣟⣾⡝⣧⢟⡾⣿⣿⣿⢧⡝⣦⣒⢤⣀⣦⣠⢾⣿⡟⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣾⣹⢯⣝⣮⢻⡜⣿⣿⣿⣿⣳⣯⣾⣿⣿⢿⣯⣿⠇⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣇⢏⡿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣽⣻⠶⣭⡗⣞⢧⣿⢿⣿⣿⣿⣿⣿⣿⣟⣿⡏⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣎⠜⣧⡻⣽⢿⣿⣿⣿⣿⣽⣿⣎⣿⣦⣽⡞⣮⢼⣛⢾⡹⢯⣿⣿⣳⣿⠇⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣾⣰⢻⣭⣛⢿⣯⢿⣿⣟⣯⣟⣼⡷⣯⣝⢮⣳⠻⣬⣛⣿⣼⣿⣽⣿⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠎⠠⠙⣯⠓⢮⠛⣾⡹⣷⡻⣯⣟⣾⡷⣟⡷⣯⢯⣷⣻⡷⣿⣾⡿⣟⣿⢸⡀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣴⡿⠁⠀⠁⠰⣯⠈⠤⡙⢤⠳⣵⣟⡿⣾⣻⣽⣟⣿⣿⣿⣿⣯⣿⣿⣯⣿⡻⢾⡉⢇⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⢨⣴⠋⠀⠀⠀⠀⠀⣿⠀⡄⠑⢢⢱⡏⣾⣽⢳⡝⣿⣿⣿⣿⣿⣿⣿⣿⣯⣷⣯⡝⢻⡄⢩⢻⣦⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣀⣴⡟⠉⠀⠠⠁⠀⠀⠀⠘⢷⣄⠑⢢⠙⣼⢣⡽⣻⢷⣿⣿⣿⣿⣿⣿⣿⣿⣟⣷⣭⢳⠽⢀⠡⢈⠙⢧⠀]],
        [[⠀⠀⠀⠀⢀⣠⡶⠞⡉⠆⡍⡒⠠⢀⣠⣆⠀⠀⠀⠀⠀⠀⠙⠷⣦⣑⠮⣳⢟⣽⣻⣷⣯⣿⣿⣿⣿⣿⣿⣿⣿⣞⠯⠊⢄⠘⡠⠈⠊⡷]],
        [[⠀⠀⠀⣤⠟⡉⠐⡀⢂⡱⢊⣥⣿⢿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⠾⢷⣿⣼⣷⣟⣿⣿⣿⡿⠿⠛⠋⠌⠤⣉⠂⠄⠡⢀⠁⡗]],
        [[⠀⣠⡊⢀⢂⠤⣱⣸⣿⣿⣝⠨⣁⣾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠁⠂⠀⠄]],
      }, {
        ["g"] = { fg = "#94CA3D", ctermfg = 29 },
        ["w"] = { fg = "#FFFFFF", ctermfg = 29 },
      }, {
        [[                wwwwwwwwww                        ]],
        [[               wwwwwww   gg    wwwwwwwww          ]],
        [[              gg   ggggggggggggggwwwwwwwww        ]],
        [[             ggggggggg       ggg wwwwwwwww        ]],
        [[             gg       g gg  g  gggwwwwwwww        ]],
        [[            gg    gg       g  g  gggggwwww        ]],
        [[           gg g  g g  gg  g  g  gg  ggggggg       ]],
        [[           g  gg gg     g   g  g g ggg gggggg     ]],
        [[           g   g g    g    g gggg gggg gggggggg   ]],
        [[           gg g     g  g ggggggggggggggggggggggg  ]],
        [[           ggg g  g gggggggggggggggggggggggggggg  ]],
        [[           g gggggggggggggggggggggggggggggggg gg  ]],
        [[           gg        ggggggggggggggggg gggg gggg  ]],
        [[            gggggggggggggggggggggggggggggggggggg  ]],
        [[               ggggggggggggggggggggggggggggggggg  ]],
        [[                ggggggggggggggggggggggggggggggg   ]],
        [[                gggggggggggggggggggggggggggggg    ]],
        [[                 gggggggggggggggggggggggggggg     ]],
        [[               ggggggggggggggggggggggggggggggg    ]],
        [[             gggg gggggggggggggggggggggggggggg    ]],
        [[          ggggg     g gggggggggggggggggggggggggg  ]],
        [[       ggggggg gg   ggggggggggggggggggggggggggggg ]],
        [[    gggggggggggg      gggggggggggggggggggggggggggg]],
        [[   ggggggggggggg         ggggggggggggggggggggggggg]],
        [[ gggggggggggggg                ggg          g gg g]],
      }))
    end,
  },
}
