local sysname = string.lower(vim.uv.os_uname().sysname)
local is_nixos = nil

if sysname == "linux" then
  local fd_os_release = assert(io.open("/etc/os-release"), "r")
  local s_os_release = fd_os_release:read("*a")
  fd_os_release:close()
  s_os_release = s_os_release:lower()
  is_nixos = s_os_release:match("nixos")
end

return {
  {
    "mason-org/mason.nvim",
    enabled = is_nixos == nil,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = is_nixos == nil,
  }
}
