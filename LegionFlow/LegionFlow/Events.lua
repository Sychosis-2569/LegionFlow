------------------------------------------------------------
-- LegionFlow
--
-- File: Events.lua
-- Author: LegionFlow Project
--
-- Description:
--     Central event dispatcher for the LegionFlow framework.
------------------------------------------------------------

local ADDON_NAME, LF = ...

------------------------------------------------------------
-- Event Frame
------------------------------------------------------------

local EventFrame = CreateFrame("Frame")

LF.EventFrame = EventFrame

------------------------------------------------------------
-- Event Registry
------------------------------------------------------------

LF.Events.Registered = {}

------------------------------------------------------------
-- Registers a callback for a Blizzard event.
------------------------------------------------------------

function LF.Events:Register(event, callback)

    assert(type(event) == "string", "Event must be a string.")
    assert(type(callback) == "function", "Callback must be a function.")

    if not self.Registered[event] then

        self.Registered[event] = {}

        EventFrame:RegisterEvent(event)

    end

    table.insert(self.Registered[event], callback)

end

------------------------------------------------------------
-- Dispatch Events
------------------------------------------------------------

EventFrame:SetScript("OnEvent", function(_, event, ...)

    local listeners = LF.Events.Registered[event]

    if not listeners then
        return
    end

    for _, callback in ipairs(listeners) do

        callback(...)

    end

end)

------------------------------------------------------------
-- Default Events
------------------------------------------------------------

LF.Events:Register("PLAYER_LOGIN", function()

    LF:Initialize()

end)

------------------------------------------------------------
-- Debug
------------------------------------------------------------

LF:Debug("Event manager initialized.")