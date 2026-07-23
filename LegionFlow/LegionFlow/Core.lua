------------------------------------------------------------
-- LegionFlow
--
-- File: Core.lua
-- Author: LegionFlow Project
--
-- Description:
--     Core initialization and framework bootstrap.
------------------------------------------------------------

local ADDON_NAME, LF = ...

-- Create the shared addon table if it doesn't already exist.
LF = LF or {}

-- Expose it globally for debugging and external access if needed.
_G.LegionFlow = LF

------------------------------------------------------------
-- Addon Metadata
------------------------------------------------------------

LF.Name = ADDON_NAME
LF.Version = "0.1.0-alpha"

------------------------------------------------------------
-- Framework Tables
------------------------------------------------------------

LF.Modules   = LF.Modules   or {}
LF.Events    = LF.Events    or {}
LF.UI        = LF.UI        or {}
LF.Database  = LF.Database  or {}
LF.Utils     = LF.Utils     or {}
LF.Config    = LF.Config    or {}

------------------------------------------------------------
-- Player Cache
------------------------------------------------------------

LF.Player = LF.Player or {
    Name    = "",
    Class    = "",
    ClassID  = "",
    Race     = "",
    RaceID   = "",
    SpecID   = 0,
    GUID     = "",
    Realm    = "",
}

------------------------------------------------------------
-- Logging
------------------------------------------------------------

function LF:Print(message)

    DEFAULT_CHAT_FRAME:AddMessage(
        string.format("|cff55ff55[%s]|r %s", self.Name, tostring(message))
    )

end

function LF:Debug(message)

    if LegionFlowDB and LegionFlowDB.Debug then
        self:Print("|cffaaaaaaDEBUG|r: " .. tostring(message))
    end

end

------------------------------------------------------------
-- Module Registration
------------------------------------------------------------

function LF:RegisterModule(name, module)

    assert(type(name) == "string", "Module name must be a string.")
    assert(type(module) == "table", "Module must be a table.")

    if self.Modules[name] then
        error(string.format("Module '%s' is already registered.", name))
    end

    self.Modules[name] = module

end

------------------------------------------------------------
-- Initialization
------------------------------------------------------------

function LF:Initialize()

    self.Player.Name = UnitName("player")
    self.Player.Class, self.Player.ClassID = UnitClass("player")
    self.Player.Race, self.Player.RaceID = UnitRace("player")
    self.Player.GUID = UnitGUID("player")
    self.Player.Realm = GetRealmName()

    self:Print(string.format(
        "%s v%s initialized.",
        self.Name,
        self.Version
    ))

end