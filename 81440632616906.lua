
local function CreateExtraTabs()

    local CombatTab = Window:CreateTab("Combat", 7733960981)
    
    CombatTab:CreateButton({
        Name = "Kill All NPCs",
        Callback = function()
            Rayfield:Notify({
                Title = "Combat",
                Content = "Executing kill all NPCs...",
                Duration = 3,
                Image = 7733960981
            })
            -- Add your combat logic here
        end
    })

    -- Teleport Tab
    local TeleportTab = Window:CreateTab("Teleport", 7733960981)
    
    TeleportTab:CreateDropdown({
        Name = "Locations",
        Options = {"Spawn", "Base", "Secret Area"},
        CurrentOption = "Spawn",
        Callback = function(Option)
            Rayfield:Notify({
                Title = "Teleporting to "..Option,
                Content = "",
                Duration = 3,
                Image = 7733960981
            })
        end
    })

    -- Player Tab
    local PlayerTab = Window:CreateTab("Player", 7733960981)
    
    PlayerTab:CreateSlider({
        Name = "WalkSpeed",
        Range = {16, 200},
        Increment = 1,
        Suffix = "studs",
        CurrentValue = 16,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    })
end

-- Execute tab creation
CreateExtraTabs()

-- Optional: Notification when tabs load
Rayfield:Notify({
    Title = "External Tabs Loaded",
    Content = "Added Combat, Teleport and Player tabs",
    Duration = 5,
    Image = 7733960981
})