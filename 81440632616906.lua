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

    -- Auto Chest Farm
    PlaceTabs:CreateToggle({
        Name = "💰 Chest Auto Farm",
        CurrentValue = false,
        Callback = function(Value)
            _G.autoChestFarm = Value
            task.spawn(function()
                while _G.autoChestFarm and task.wait() do
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
                    end)
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
                while _G.autoSpinFarm and task.wait(0.5) do
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
                while _G.infiniteDominusPet and task.wait() do
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(4)
                    end)
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
                while _G.instaWinLoop and task.wait() do
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local char = player.Character or player.CharacterAdded:Wait()
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        
                        if hrp then
                            for i = 1, 10 do
                                local world = workspace:FindFirstChild("World"..i)
                                if world then
                                    local winPart = world:FindFirstChild("WinPart")
                                    if winPart then
                                        hrp.CFrame = winPart.CFrame + Vector3.new(0, 8, 0)
                                        break
                                    end
                                end
                            end
                        end
                    end)
                end
            end)
        end,
    })
end

-- Execute tab creation
CreateExtraTabs()

-- Notification
Rayfield:Notify({
    Title = "Tabs Loaded",
    Content = "Game-specific features activated!",
    Duration = 5,
    Image = 7733960981
})
