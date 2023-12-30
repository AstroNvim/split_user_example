---@param executable string
---@return boolean
local function has_excecutable(executable)
	-- TODO: warn the user if not found
	return vim.fn.executable(executable) == 1
end

---@return boolean
local function is_on_glibc()
	local result = vim.fn.system("ldd --version")
	return result:match("GNU libc") ~= nil
end

local function is_on_alpine()
	local output = vim.fn.system("cat /etc/os-release")
	return string.find(output, "alpine") ~= nil
end

return {
	is_on_glibc = is_on_glibc,
	has_excecutable = has_excecutable,
	is_on_alpine = is_on_alpine,
}