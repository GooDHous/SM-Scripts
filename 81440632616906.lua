-- Создаем вкладку для игры
local gameTab = Window:CreateTab("Game Features", 7733960981)

-- 1. Auto Gem Farm (ваша оригинальная функция)
local autoGemEnabled = false
gameTab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = false,
    Callback = function(Value)
        autoGemEnabled = Value
        while autoGemEnabled and task.wait(0.1) do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            end)
        end
    end
})

-- 2. Auto Chest Farm (ваша оригинальная функция)
local autoChestEnabled = false
gameTab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = false,
    Callback = function(Value)
        autoChestEnabled = Value
        while autoChestEnabled and task.wait(0.1) do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            end)
        end
    end
})

-- 3. Insta-Win (ваша оригинальная функция)
local instaWinEnabled = false
gameTab:CreateToggle({
    Name = "🏆 Insta-Win",
    CurrentValue = false,
    Callback = function(Value)
        instaWinEnabled = Value
        while instaWinEnabled and task.wait(0.5) do
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
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
            end)
        end
    end
})

-- Уведомление о загрузке
Rayfield:Notify({
    Title = "Game Features Loaded",
    Content = "Special features activated!",
    Duration = 5,
    Image = 7733960981
})
