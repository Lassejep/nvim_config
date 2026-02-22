local M = {}

-- Store the current system prompt content
M.current_system_prompt = nil

-- Get the absolute path to system prompts directory
M.get_prompts_dir = function()
  local config_root = vim.fn.stdpath("config")
  return config_root .. "/ai/system_prompts/"
end

-- Check if prompts directory exists, create it if not
M.ensure_prompts_dir = function()
  local prompts_dir = M.get_prompts_dir()
  if vim.fn.isdirectory(prompts_dir) == 0 then
    vim.fn.mkdir(prompts_dir, "p")
    vim.notify("Created system prompts directory: " .. prompts_dir, vim.log.levels.INFO)
  end
  return prompts_dir
end

-- Open Telescope selector for system prompts
M.select_system_prompt = function()
  local prompts_dir = M.ensure_prompts_dir()

  -- Check if Telescope is available
  if not pcall(require, "telescope.builtin") then
    vim.notify("Telescope is not available", vim.log.levels.ERROR)
    return
  end

  -- Set up Telescope picker
  local opts = {
    cwd = prompts_dir,
    prompt_title = "Select System Prompt",
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      -- Custom action when file is selected
      local on_select = function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if selection then
          local file_path = prompts_dir .. selection[1]
          M.set_system_prompt_from_file(file_path)
        end
      end

      -- Map Enter to select file
      map("i", "<CR>", on_select)
      map("n", "<CR>", on_select)

      return true
    end,
  }

  require("telescope.builtin").find_files(opts)
end

-- Set system prompt from file content
M.set_system_prompt_from_file = function(file_path)
  local success, content = pcall(vim.fn.readfile, file_path)

  if not success then
    vim.notify("Failed to read file: " .. file_path, vim.log.levels.ERROR)
    return
  end

  M.current_system_prompt = table.concat(content, "\n")
  vim.notify("System prompt loaded from: " .. vim.fn.fnamemodify(file_path, ":t"), vim.log.levels.INFO)

  -- You can add additional logic here to notify CodeCompanion about the change
  -- For example, you might want to restart the current chat session
end

-- Get the current system prompt function for CodeCompanion
M.get_system_prompt_fn = function()
  return function(ctx)
    if M.current_system_prompt then
      return M.current_system_prompt
    end
    -- Fall back to default system prompt if none is set
    return ctx.default_system_prompt
  end
end

return M
