require("oil").setup({
  default_file_explorer = true,
  view_options = {
    show_hidden = true,
  },
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_changes = false,
  },
  constrain_cursor = "editable",
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-o>"] = "actions.preview",
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
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
