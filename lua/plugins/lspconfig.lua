local sysname = string.lower(vim.uv.os_uname().sysname)
local is_nixos = nil

if sysname == "linux" then
  local fd_os_release = assert(io.open("/etc/os-release"), "r")
  local s_os_release = fd_os_release:read("*a")
  fd_os_release:close()
  s_os_release = s_os_release:lower()
  is_nixos = s_os_release:match("nixos")
end

if is_nixos == nil then
  print('is not nixos')
else
  print('is nixos')
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      denols = {
        enabled = true,
      },
      texlab = {
        mason = is_nixos == nil,
      },
      lua_ls = {
        mason = is_nixos == nil,
      },
      marksman = {
        mason = is_nixos == nil,
      },
    },
  },
}
