-- External Tabs Definition
local function CreateExtraTabs()
    -- Get game name safely
    local gameName = "Current Game"
    pcall(function()
        gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end)

    -- Create main tab with game name
    local PlaceTabs = Window:CreateTab(gameName, 7733960981)
    local farmingSection = PlaceTabs:CreateSection("Farming")
    
    _G.autoChestFarm = false
    _G.autoSpinFarm = false
    _G.infiniteDominusPet = false
    _G.instaWinLoop = false

    PlaceTabs:CreateToggle({
        Name = "💎 Auto Gem",
        CurrentValue = false,
        SectionParent = farmingSection,
        Flag = "GemFarm",
        Callback = function(Value)
            _G.infiniteDominusPet = Value
            task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            end
        end)
    end,
})
    -- Auto Chest Farm
    PlaceTabs:CreateToggle({
        Name = "💰 Chest Auto Farm",
        CurrentValue = false,
        Callback = function(Value)
        _G.autoChestFarm = Value
        task.spawn(function()
            while _G.autoChestFarm do
                task.wait(0)
                game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            end
        end)
    end,
})
    
    -- Unlimited Spins
    PlaceTabs:CreateToggle({
        Name = "🎰 Unlimited Spins",
        CurrentValue = false,
        Callback = function(Value)
            _G.autoSpinFarm = Value
            task.spawn(function()
            while _G.autoSpinFarm do
                task.wait(0.5)
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(3)
                end)
            end
        end)
    end,
})

    -- Auto Triple Dominus
    PlaceTabs:CreateToggle({
        Name = "👑 Auto Triple Dominus",
        CurrentValue = false,
        Callback = function(Value)
        _G.infiniteDominusPet = Value
        task.spawn(function()
            while _G.infiniteDominusPet do
                task.wait(0.0)
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(4)
            end
        end)
    end,
})


    -- Smart Insta-Win
    PlaceTabs:CreateToggle({
        Name = "🤖 Smart Insta-Win",
        CurrentValue = false,
        Callback = function(Value)
            _G.instaWinLoop = Value
            task.spawn(function()
            local player = game.Players.LocalPlayer

            while _G.instaWinLoop do
                task.wait(0.0)

                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end

                local closestWinPart = nil
                local shortestDistance = math.huge
                local worldIndex = nil

                -- Search all 10 worlds and find the closest WinPart
                for i = 1, 10 do
                    local world = workspace:FindFirstChild("World" .. i)
                    if world then
                        local winPart = world:FindFirstChild("WinPart")
                        if winPart then
                            local distance = (hrp.Position - winPart.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestWinPart = winPart
                                worldIndex = i
                            end
                        end
                    end
                end

                if closestWinPart then
                    hrp.CFrame = closestWinPart.CFrame + Vector3.new(0, 8, 0)

                    Rayfield:Notify({
                        Title = "рџЊЌ Insta-Win",
                        Content = "Teleported to World " .. tostring(worldIndex) .. " WinPart!",
                        Duration = 2,
                        Image = 9605261863
                    })
                end
            end
        end)
    end,
})

-- Execute tab creation
CreateExtraTabs()

-- Notification
Rayfield:Notify({
    Title = "Tabs Loaded",
    Content = "Game-specific features activated!",
    Duration = 5,
    Image = 7733960981
})
