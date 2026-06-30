local cmp_status, cmp = pcall(require, "cmp")
local luasnip_status, luasnip = pcall(require, "luasnip")

if not cmp_status or not luasnip_status then
  print("Warning: cmp or luasnip not installed properly via Nix")
  return
end

local is_cc_env = string.find(vim.fn.getcwd(), "contest%-code") ~= nil

if is_cc_env then
  require("luasnip.loaders.from_lua").load({ paths = { vim.fn.expand("~/contest-code/templates/snippets") } })
end

local active_sources
if is_cc_env then
  active_sources = cmp.config.sources({
    { name = "luasnip" },
  })
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = active_sources
})
