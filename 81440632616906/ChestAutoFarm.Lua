_G.autoChestFarm = CurrentValue
        task.spawn(function()
            while _G.autoChestFarm do
                task.wait(0)
                game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            end
        end)
