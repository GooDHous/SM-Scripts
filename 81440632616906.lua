-- external_tabs.lua
return function(Window, Rayfield)  -- Принимаем Window и Rayfield как аргументы
    -- Получаем информацию об игре
    local gameName = "Current Game"
    local success, gameInfo = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    end)
    if success and gameInfo then
        gameName = gameInfo.Name
    end

    -- Создаем вкладку для конкретной игры
    local gameTab = Window:CreateTab(gameName, 7733960981)
    
    -- Секция для автоматизации
    local autoSection = gameTab:CreateSection("Auto Farm")
    
    -- Auto Gem Farm
    gameTab:CreateToggle({
        Name = "💎 Auto Gem Farm",
        CurrentValue = false,
        SectionParent = autoSection,
        Callback = function(Value)
            _G.AutoGemFarm = Value
            if Value then
                Rayfield:Notify({
                    Title = "Auto Gem",
                    Content = "Enabled automatic gem farming",
                    Duration = 3,
                    Image = 7733960981
                })
            end
            while _G.AutoGemFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
                end)
            end
        end
    })

    -- Auto Chest Farm
    gameTab:CreateToggle({
        Name = "💰 Chest Auto Farm",
        CurrentValue = false,
        SectionParent = autoSection,
        Callback = function(Value)
            _G.AutoChestFarm = Value
            if Value then
                Rayfield:Notify({
                    Title = "Chest Farm",
                    Content = "Enabled automatic chest farming",
                    Duration = 3,
                    Image = 7733960981
                })
            end
            while _G.AutoChestFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
                end)
            end
        end
    })

    -- Секция для телепортации
    local teleportSection = gameTab:CreateSection("Teleport")
    
    -- Teleport to Spawn
    gameTab:CreateButton({
        Name = "⬆️ Teleport to Spawn",
        SectionParent = teleportSection,
        Callback = function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = game:GetService("Workspace").SpawnLocation.CFrame
                Rayfield:Notify({
                    Title = "Teleported",
                    Content = "Moved to spawn point",
                    Duration = 2,
                    Image = 7733960981
                })
            end
        end
    })

    -- Информационная секция
    local infoSection = gameTab:CreateSection("Info")
    gameTab:CreateLabel("Game: " .. gameName, infoSection)
    gameTab:CreateLabel("PlaceID: " .. game.PlaceId, infoSection)
    
    Rayfield:Notify({
        Title = "Game Features Loaded",
        Content = "Added special features for " .. gameName,
        Duration = 5,
        Image = 7733960981
    })
end
