local lspkind = require('lspkind')
local cmp = require('cmp')

cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            with_text = true, -- do not show text alongside icons
            maxwidth = 50 -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            --   before = function (entry, vim_item)
            -- ...
            -- return vim_item
            --   end
        })
    },
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        -- 目前无效 没找到冲突的快捷键
        -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        ['<S-tab>'] = cmp.mapping(cmp.mapping.select_prev_item()),
        ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item())
    },
    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, -- For vsnip users.
    {
        name = 'vsnip'
    } -- For luasnip users.
    -- { name = 'luasnip' } -- For ultisnips users.
    -- { name = 'ultisnips' },
    -- -- For snippy users.
    -- { name = 'snippy' },
    }, {{
        name = 'buffer'
    }, {
        name = 'path'
    }})
}

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
    sources = {{
        name = 'buffer'
    }}
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{
        name = 'path'
    }}, {{
        name = 'cmdline'
    }})
})
