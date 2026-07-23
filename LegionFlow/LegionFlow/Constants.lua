------------------------------------------------------------
-- LegionFlow
--
-- File: Constants.lua
-- Author: LegionFlow Project
--
-- Description:
--     Framework-wide constants used throughout LegionFlow.
------------------------------------------------------------

local ADDON_NAME, LF = ...

------------------------------------------------------------
-- Expansion Information
------------------------------------------------------------

LF.EXPANSION = "Legion"
LF.PATCH = "7.3.5"
LF.INTERFACE = 70300

------------------------------------------------------------
-- Addon Information
------------------------------------------------------------

LF.AUTHOR = "LegionFlow Project"
LF.VERSION = LF.Version

------------------------------------------------------------
-- Class Tokens
------------------------------------------------------------

LF.Class = {

    DEATHKNIGHT = "DEATHKNIGHT",
    DEMONHUNTER = "DEMONHUNTER",
    DRUID = "DRUID",
    HUNTER = "HUNTER",
    MAGE = "MAGE",
    MONK = "MONK",
    PALADIN = "PALADIN",
    PRIEST = "PRIEST",
    ROGUE = "ROGUE",
    SHAMAN = "SHAMAN",
    WARLOCK = "WARLOCK",
    WARRIOR = "WARRIOR",

}

------------------------------------------------------------
-- Player Roles
------------------------------------------------------------

LF.Role = {

    TANK = "TANK",
    HEALER = "HEALER",
    DAMAGER = "DAMAGER",

}

------------------------------------------------------------
-- Chat Colors
------------------------------------------------------------

LF.Color = {

    Prefix = "|cff55ff55",
    Debug  = "|cffaaaaaa",
    Error  = "|cffff5555",
    Warning = "|cffffff55",
    Reset = "|r",

}

------------------------------------------------------------
-- Module States
------------------------------------------------------------

LF.ModuleState = {

    REGISTERED = 1,
    INITIALIZED = 2,
    ENABLED = 3,
    DISABLED = 4,

}

------------------------------------------------------------
-- Debug Levels
------------------------------------------------------------

LF.DebugLevel = {

    NONE = 0,
    BASIC = 1,
    VERBOSE = 2,

}