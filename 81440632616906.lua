-- Создаем вкладку
local tab = Window:CreateTab("Game Features", 7733960981)

-- 1. Auto Gem Farm (исправленный)
tab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = _G.AutoGemFarm or false,
    Callback = function(Value)
        _G.AutoGemFarm = Value
        task.spawn(function()
            while _G.AutoGemFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
                end)
            end
        end)
    end
})

-- 2. Auto Chest Farm (исправленный)
tab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = _G.AutoChestFarm or false,
    Callback = function(Value)
        _G.AutoChestFarm = Value
        task.spawn(function()
            while _G.AutoChestFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
                end)
            end
        end)
    end
})

-- 3. Insta-Win (исправленный)
tab:CreateToggle({
    Name = "🏆 Insta-Win",
    CurrentValue = _G.InstaWinLoop or false,
    Callback = function(Value)
        _G.InstaWinLoop = Value
        task.spawn(function()
            while _G.InstaWinLoop and task.wait(0.5) do
                pcall(function()
                    local player = game.Players.LocalPlayer
                    local char = player.Character
                    if char then
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            for i = 1, 10 do
                                local world = workspace:FindFirstChild("World"..i)
                                if world then
                                    local winPart = world:FindFirstChild("WinPart", true)
                                    if winPart then
                                        hrp.CFrame = winPart.CFrame + Vector3.new(0, 8, 0)
                                        break
                                    end
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
})

-- Уведомление
Rayfield:Notify({
    Title = "Features Loaded",
    Content = "Game-specific features activated!",
    Duration = 3,
    Image = 7733960981
})
