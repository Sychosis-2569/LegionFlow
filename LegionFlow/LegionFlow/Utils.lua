------------------------------------------------------------
-- LegionFlow
--
-- File: Utils.lua
-- Author: LegionFlow Project
--
-- Description:
--     Shared helper functions used throughout LegionFlow.
------------------------------------------------------------

local ADDON_NAME, LF = ...

------------------------------------------------------------
-- Color Formatting
------------------------------------------------------------

---Wraps text in a WoW color code.
---@param color string
---@param text string
---@return string
function LF.Utils:ColorText(color, text)

    return string.format("%s%s%s", color, tostring(text), LF.Color.Reset)

end

------------------------------------------------------------
-- Number Formatting
------------------------------------------------------------

---Rounds a number to the specified number of decimal places.
---@param value number
---@param decimals number
---@return number
function LF.Utils:Round(value, decimals)

    decimals = decimals or 0

    local multiplier = 10 ^ decimals

    return math.floor(value * multiplier + 0.5) / multiplier

end

------------------------------------------------------------
-- String Helpers
------------------------------------------------------------

---Returns "Yes" or "No".
---@param value boolean
---@return string
function LF.Utils:YesNo(value)

    if value then
        return "Yes"
    end

    return "No"

end

------------------------------------------------------------
-- Time Formatting
------------------------------------------------------------

---Formats a duration into a readable string.
---@param seconds number
---@return string
function LF.Utils:FormatTime(seconds)

    if seconds >= 60 then
        return string.format("%.1fm", seconds / 60)
    end

    if seconds >= 1 then
        return string.format("%.1fs", seconds)
    end

    return string.format("%.0fms", seconds * 1000)

end

------------------------------------------------------------
-- Table Helpers
------------------------------------------------------------

---Returns the number of entries in a table.
---@param tbl table
---@return integer
function LF.Utils:TableCount(tbl)

    local count = 0

    for _ in pairs(tbl) do
        count = count + 1
    end

    return count

end

------------------------------------------------------------
-- Debug
------------------------------------------------------------

LF:Debug("Utils initialized.")