-- Create the addon frame
local addon = CreateFrame("Frame")
local playerFrame = PlayerFrame

-- Register events
addon:RegisterEvent("GROUP_ROSTER_UPDATE")
addon:RegisterEvent("ADDON_LOADED")

-- Function to update frame visibility
local function UpdateFrames()
    -- Simple logic: Hide player frame only in parties (not raids)
    if IsInGroup() and not IsInRaid() then
        playerFrame:Hide()
    else
        playerFrame:Show()
    end
end

-- Event handler
addon:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        if ... == "HidePlayerInParty" then
            UpdateFrames()
        end
    elseif event == "GROUP_ROSTER_UPDATE" then
        UpdateFrames()
    end
end)