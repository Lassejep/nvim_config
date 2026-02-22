return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },

  opts = {
    display = { diff = { enabled = false } },

    prompt_library = {
      markdown = {
        dirs = {
          vim.fn.getcwd() .. "/.prompts",
        },
      },
    },

    opts = {
      log_level = "DEBUG",
    },

    interactions = {
      chat = {
        selection_strategy = "telescope",
        adapter = "deepseek",
        model = "deepseek-reasoner",
        show_token_count = true,
        opts = {
          system_prompt = function(ctx)
            local system_prompts_manager = require("ai.system_prompts_manager")
            return system_prompts_manager.get_system_prompt_fn()(ctx)
          end,
        },
        keymaps = {
          close = { modes = { n = "q", i = "<C-c>" } },
          stop = { modes = { n = "<leader>cs", i = "<C-s>" } },
          regenerate = { modes = { n = "<leader>cr", i = "<C-r>" } },
          codeblock = { modes = { n = "<leader>ci", i = "<C-i>" } },
          debug = { modes = { n = "<leader>cd", i = "<C-d>" } },
          yank_code = { modes = { n = "<leader>cy", i = "<C-y>" } },
          clear = { modes = { n = "<leader>cx", i = "<C-x>" } },
        },
      },

      cmd = {
        adapter = "deepseek",
        model = "deepseek-chat",
      },
    },
  },

  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "[C]odeCompanion[C]hat" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "[C]odeCompanion[A]ctions" },
    {
      "<leader>cp",
      function()
        require("ai.system_prompts_manager").select_system_prompt()
      end,
      desc = "[C]odeCompanion[P]rompt select",
    },
  },
}
