-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "svelte",
  callback = function()
    -- Create a custom, ultra-lightweight Svelte indent engine
    _G.SvelteSimpleIndent = function()
      local lnum = vim.v.lnum
      if lnum == 1 then
        return 0
      end

      local prev_lnum = vim.fn.prevnonblank(lnum - 1)
      local prev_line = vim.fn.getline(prev_lnum)
      local cur_line = vim.fn.getline(lnum)
      local indent = vim.fn.indent(prev_lnum)
      local sw = vim.fn.shiftwidth()

      -- 1. INCREASE indent if previous line ends with {, [, (
      if prev_line:match("[%{[(]%s*$") then
        indent = indent + sw
      -- 2. INCREASE indent if previous line ends with an opening tag (like <main> or <script>)
      --    but ignore self-closing tags like <input />
      elseif prev_line:match("<[a-zA-Z][^>]*>%s*$") and not prev_line:match("/>%s*$") then
        indent = indent + sw
      end

      -- 3. DECREASE indent if current line starts with }, ], )
      if cur_line:match("^%s*[%}%)%]]") then
        indent = indent - sw
      -- 4. DECREASE indent if current line starts with a closing tag (like </main>)
      elseif cur_line:match("^%s*</") then
        indent = indent - sw
      end

      return math.max(0, indent)
    end

    -- Apply the custom engine and disable the default smartindent
    vim.bo.indentexpr = "v:lua.SvelteSimpleIndent()"
    -- Tell Neovim to instantly snap backward when typing }, ], or </
    vim.bo.indentkeys = "0{,0},0),0],!^F,o,O,e,0=</"

    vim.bo.smartindent = false
    vim.bo.autoindent = true
  end,
})
