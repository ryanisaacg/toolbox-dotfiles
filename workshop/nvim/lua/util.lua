local api = vim.api

local function keys(command)
    return api.nvim_feedkeys(command, 'm', false)
end

local function termcode(string)
    return api.nvim_replace_termcodes(string, true, true, true)
end

local function unload(pkg)
    package.loaded[pkg] = nil
end

return {
    keys = keys,
    termcode = termcode,
    unload = unload,
}
