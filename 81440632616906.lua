-- Просто создаем вкладку и добавляем элементы
local tab = Window:CreateTab("Game Features", 7733960981)

-- 1. Auto Gem Farm (ваша оригинальная функция)
_G.AutoGemFarm = false
tab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = _G.AutoGemFarm,
    Callback = function(Value)
        _G.AutoGemFarm = Value
        while _G.AutoGemFarm do
            game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            task.wait(0.1)
        end
    end
})

-- 2. Auto Chest Farm (ваша оригинальная функция)
_G.AutoChestFarm = false
tab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = _G.AutoChestFarm,
    Callback = function(Value)
        _G.AutoChestFarm = Value
        while _G.AutoChestFarm do
            game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            task.wait(0.1)
        end
    end
})

-- 3. Insta-Win (ваша оригинальная функция)
_G.InstaWinLoop = false
tab:CreateToggle({
    Name = "🏆 Insta-Win",
    CurrentValue = _G.InstaWinLoop,
    Callback = function(Value)
        _G.InstaWinLoop = Value
        while _G.InstaWinLoop do
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
            task.wait(0.5)
        end
    end
})
