------------------------------------------------------------
-- LegionFlow
--
-- File: SlashCommands.lua
--
-- Description:
--     Handles all slash commands for LegionFlow.
------------------------------------------------------------

local ADDON_NAME, LF = ...

------------------------------------------------------------
-- Command Registry
------------------------------------------------------------

LF.Commands = LF.Commands or {}
LF.Commands.Registry = {}

------------------------------------------------------------
-- Register a Command
------------------------------------------------------------

---Registers a slash command.
---@param command string
---@param callback function
function LF.Commands:Register(command, callback)

    command = string.lower(command)

    self.Registry[command] = callback

end

------------------------------------------------------------
-- Default Command
------------------------------------------------------------

local function PrintStatus()

    LF:Print("------------------------------------")
    LF:Print("LegionFlow")
    LF:Print("Version : " .. LF.Version)
    LF:Print("Patch   : " .. LF.PATCH)
    LF:Print("------------------------------------")
    LF:Print("Player  : " .. (LF.Player.Name or "Unknown"))
    LF:Print("Class   : " .. (LF.Player.Class or "Unknown"))
    LF:Print("Realm   : " .. (LF.Player.Realm or "Unknown"))
    LF:Print("------------------------------------")

end

------------------------------------------------------------
-- Built-in Commands
------------------------------------------------------------

LF.Commands:Register("help", function()

    LF:Print("Available Commands:")
    LF:Print("/lf")
    LF:Print("/lf help")
    LF:Print("/lf version")

end)

LF.Commands:Register("version", function()

    LF:Print(string.format(
        "%s v%s",
        LF.Name,
        LF.Version
    ))

end)

------------------------------------------------------------
-- Slash Handler
------------------------------------------------------------

SLASH_LEGIONFLOW1 = "/lf"

SlashCmdList["LEGIONFLOW"] = function(msg)

    msg = string.lower(msg or "")

    if msg == "" then

        PrintStatus()
        return

    end

    local callback = LF.Commands.Registry[msg]

    if callback then

        callback()
        return

    end

    LF:Print("Unknown command: " .. msg)
    LF:Print("Type /lf help")

end

------------------------------------------------------------
-- Debug
------------------------------------------------------------

LF:Debug("Slash command system initialized.")