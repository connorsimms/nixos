require("oil").setup({
  default_file_explorer = true,

  delete_to_trash = false,
  cleanup_delay_ms = 10000,

  view_options = {
    show_hidden = true,
  },

  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_changes = false,
  },

  -- Reloads filesystem changes
  watch_for_changes = true,

  constrain_cursor = "editable",

  use_default_keymaps = false,
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<leader>ff"] = {
      function()
        require("telescope.builtin").find_files({
          cwd = require("oil").get_current_dir()
        })
      end,
      mode = "n",
      nowait = true,
      desc = "Find files in the current directory"
    },
  },
})

vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
