return {
  -- 1. Cap TypeScript & Python LSP RAM usage
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              tsserver = {
                maxTsServerMemory = 1024,
              },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = false, -- Saves massive RAM on Django projects
                diagnosticMode = "openFilesOnly", -- Only analyze open files, not entire venv
              },
            },
          },
        },
      },
    },
  },

  -- 2. Properly configure rust-analyzer via rustaceanvim (for Axum / Actix / Tokio)
  {
    "mrcjkb/rustaceanvim",
    optional = true,
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "check",
            },
            cachePriming = {
              enable = false, -- Prevents RAM spikes when opening Axum/Actix crates
            },
          },
        },
      },
    },
  },

  -- 3. Run linting only on save/leave insert mode
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    },
  },
}
