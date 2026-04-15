---@type LazySpec
return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    main = "lsp_signature",
    opts = {},
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem = opts.filesystem or {}
      opts.filesystem.filtered_items = vim.tbl_deep_extend("force", opts.filesystem.filtered_items or {}, {
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".github",
          ".gitignore",
          "package-lock.json",
          "yarn.lock",
        },
        never_show = { ".git", ".DS_Store" },
      })
      return opts
    end,
  },
  {
    "max397574/better-escape.nvim",
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts or {}, {
        default_mappings = false,
      })
      opts.mappings = {
        i = {
          j = { k = "<Esc>" },
          k = { j = "<Esc>" },
        },
      }
      return opts
    end,
  },
}
