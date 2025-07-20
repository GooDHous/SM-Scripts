-- Создаем вкладку
local tab = Window:CreateTab("Game Features", 7733960981)

-- 1. Auto Gem Farm (ваш код)
local gemToggle = tab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoGem = Value
        while _G.AutoGem do
            game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            task.wait(0.1)
        end
    end
})

-- 2. Auto Chest Farm (ваш код)
local chestToggle = tab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoChest = Value
        while _G.AutoChest do
            game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            task.wait(0.1)
        end
    end
})

-- 3. Insta-Win (ваш код)
local winToggle = tab:CreateToggle({
    Name = "🏆 Insta-Win",
    CurrentValue = false,
    Callback = function(Value)
        _G.InstaWin = Value
        while _G.InstaWin do
            local player = game.Players.LocalPlayer
            if player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
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
            task.wait(0.5)
        end
    end
})

-- Уведомление о загрузке
Rayfield:Notify({
    Title = "Game Features Loaded",
    Content = "Special features activated!",
    Duration = 3,
    Image = 7733960981
})
