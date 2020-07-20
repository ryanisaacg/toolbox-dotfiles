local util = require('util')
local api = vim.api

local function genToday()
    util.keys(' w y')
    util.keys('/Plans\n')
    util.keys(' c')
    util.keys('VGy')
    util.keys(' w w')
    local header = os.date('# %A, %d %B %Y') -- Monday, 20 July 2020
    util.keys('i'..header..util.termcode('\n<Esc>'))
    util.keys('p')
end

local function genDays()
    days = { 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday', 'Next week' }
    util.keys(util.termcode('<Esc>'))
    for _, day in ipairs(days) do
        util.keys('i'..day..':'..util.termcode('\n<Esc>'))
    end
end


return {
    genToday = genToday,
    genDays = genDays,
}
