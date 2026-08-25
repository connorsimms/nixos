return {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = { disabled = { 'inactive-code' } },
      check = { command = 'clippy' },
    },
  },
}
