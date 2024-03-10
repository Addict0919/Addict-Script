-- Credits to WiriScript --

json = require "pretty.json"

--------------------------
-- FILE
--------------------------

ini = {}

-- Saves a table with key-value pairs in an INI format file.
-- @param fileName string - The name of the file to save.
-- @param obj table - The table containing key-value pairs to be saved in the INI file.
function ini.save(fileName, obj)
    local file, err = io.open(fileName, "w")
    if not file then
        error("Error opening file: " .. err)
    end
    
    local sections = {}
    
    for section, tbl in pairs(obj) do
        assert(type(tbl) == "table", "Expected field " .. section .. " to be a table, got " .. type(tbl))
        
        local lines = {}
        table.insert(lines, string.format("[%s]", section))
        
        for k, v in pairs(tbl) do
            table.insert(lines, string.format("%s=%s", k, v))
        end
        
        table.insert(sections, table.concat(lines, '\n') .. '\n')
    end
    
    file:write(table.concat(sections, '\n'))
    file:close()
end

-- Parses a table from an INI format file.
-- @param fileName string - The name of the file to load.
-- @return table - The parsed table from the INI file.
function ini.load(fileName)
    assert(type(fileName) == "string", "fileName must be a string")
    
    local file, err = io.open(fileName, "r")
    if not file then
        error("Error loading file: " .. err)
    end
    
    local data = {}
    local section
    
    for line in file:lines() do
        local tempSection = string.match(line, '^%[([^%]]+)%]$')

        if tempSection ~= nil then
            section = tonumber(tempSection) and tonumber(tempSection) or tempSection
            data[section] = data[section] or {}
        end

        local param, value = string.match(line, '^([%w_]+)%s*=%s*(.+)$')
        if section ~= nil and param and value ~= nil then
            if value == "true" then
                value = true
            elseif value == "false" then
                value = false
            elseif tonumber(value) then
                value = tonumber(value)
            end
            data[section][tonumber(param) or param] = value
        end
    end
    
    file:close()
    return data
end

local parseJson = json.parse

-- Parses a JSON file and returns the parsed content.
-- @param filePath string - The path to the JSON file.
-- @param withoutNull? boolean - Optional parameter to exclude null values.
-- @return boolean - Indicates success or failure of parsing.
-- @return string|table - If successful, returns the parsed JSON content, otherwise an error message.
json.parse = function(filePath, withoutNull)
    local file, err = io.open(filePath, "r")
    if not file then
        return false, err
    end
    
    local content = file:read("a")
    local fileName = string.match(filePath, '^.+[\\/](.+)')
    if #content == 0 then
        file:close()
        return false, fileName .. " is empty"
    end
    
    file:close()
    return pcall(parseJson, content, withoutNull)
end