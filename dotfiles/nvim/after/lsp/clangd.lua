return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--header-insertion=never',
    '--completion-style=detailed',
    '--query-driver=**',
  },
}
