---@brief
---
--- https://github.com/golang/tools/tree/master/gopls
---
--- Google's lsp server for golang.

--- @class go_dir_custom_args
---
--- @field envvar_id string
---
--- @field custom_subdir string?

local go_dirs = nil
local go_dirs_waiters = {}

---@param custom_args go_dir_custom_args
---@param on_complete fun(dir: string | nil)
local function identify_go_dir(custom_args, on_complete)
  local cmd = { 'go', 'env', custom_args.envvar_id }
  vim.system(cmd, { text = true }, function(output)
    local res = vim.trim(output.stdout or '')
    if output.code == 0 and res ~= '' then
      if custom_args.custom_subdir and custom_args.custom_subdir ~= '' then
        res = vim.fs.joinpath(res, custom_args.custom_subdir)
      end
      on_complete(res)
    else
      vim.schedule(function()
        vim.notify(
          ('[gopls] identify ' .. custom_args.envvar_id .. ' dir cmd failed with code %d: %s\n%s'):format(
            output.code,
            vim.inspect(cmd),
            output.stderr
          ),
          vim.log.levels.WARN
        )
      end)
      on_complete(nil)
    end
  end)
end

---@param on_complete fun(dirs: { mod_cache: string?, std_lib: string? })
local function get_go_dirs(on_complete)
  if go_dirs then
    on_complete(go_dirs)
    return
  end

  go_dirs_waiters[#go_dirs_waiters + 1] = on_complete
  if #go_dirs_waiters > 1 then
    return
  end

  local dirs = {}
  local pending = 2
  local function complete()
    pending = pending - 1
    if pending > 0 then
      return
    end

    go_dirs = dirs
    local waiters = go_dirs_waiters
    go_dirs_waiters = {}
    for _, waiter in ipairs(waiters) do
      waiter(go_dirs)
    end
  end

  identify_go_dir({ envvar_id = 'GOROOT', custom_subdir = 'src' }, function(dir)
    dirs.std_lib = dir
    complete()
  end)
  identify_go_dir({ envvar_id = 'GOMODCACHE' }, function(dir)
    dirs.mod_cache = dir
    complete()
  end)
end

---@param fname string
---@return string?
local function get_root_dir(fname, dirs)
  if
    (dirs.mod_cache and vim.fs.relpath(dirs.mod_cache, fname))
    or (dirs.std_lib and vim.fs.relpath(dirs.std_lib, fname))
  then
    local clients = vim.lsp.get_clients({ name = 'gopls' })
    if #clients > 0 then
      return clients[#clients].config.root_dir
    end
  end
  return vim.fs.root(fname, 'go.work') or vim.fs.root(fname, 'go.mod') or vim.fs.root(fname, '.git')
end

return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    get_go_dirs(function(dirs)
      -- see: https://github.com/neovim/nvim-lspconfig/issues/804
      on_dir(get_root_dir(fname, dirs))
    end)
  end,
  settings = {
    -- https://github.com/golang/tools/blob/master/gopls/doc/settings.md#analyses-mapstringbool
    gopls = {
      analyses = {
        ST1000 = false,
        ST1003 = false,
      },
      staticcheck = true,
      -- hints = { ignoredError = true },
    },
  },
}
