vim.pack.add({ "https://github.com/olimorris/codecompanion.nvim" })

require("codecompanion").setup({
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
})

vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "[C]odeCompanion[C]hat" })
vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "[C]odeCompanion[A]ctions" })
vim.keymap.set("n", "<leader>cp", function()
  require("ai.system_prompts_manager").select_system_prompt()
end, { desc = "[C]odeCompanion[P]rompt select" })
