local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup{
	snippet = {

		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require'luasnip'.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Клавиши, которые будут взаимодействовать в nvim-cmp
	mapping = {
	["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
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
    end, { "i", "s" }),},

	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },                -- LSP 👄
		{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
		{ name = 'luasnip' },                 -- Luasnip 🐌
		{ name = 'buffer' },                  -- Буфферы 🐃
		{ name = 'path' },                    -- Пути 🪤
		{ name = "emoji" },                   -- Эмодзи 😳
	}, {
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		})
	}
}
