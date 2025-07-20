-- Все функции теперь полностью самодостаточны
local function AutoGemFarm(Value)
    _G.AutoGemFarm = Value
    while _G.AutoGemFarm do
        task.wait(0.1)
        pcall(function()
            local remotes = game:GetService("ReplicatedStorage").Remotes
            if remotes:FindFirstChild("SpinPrizeEvent") then
                remotes.SpinPrizeEvent:FireServer(5)
            end
        end)
    end
end

local function AutoChestFarm(Value)
    _G.AutoChestFarm = Value
    while _G.AutoChestFarm do
        task.wait(0.1)
        pcall(function()
            local remotes = game:GetService("ReplicatedStorage").Remotes
            if remotes:FindFirstChild("TreasureEvent") then
                remotes.TreasureEvent:FireServer("Chest")
            end
        end)
    end
end

local function InstaWin(Value)
    _G.InstaWinLoop = Value
    while _G.InstaWinLoop do
        task.wait(0.5)
        pcall(function()
            local player = game.Players.LocalPlayer
            local char = player.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
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

-- Создаем вкладку
local tab = Window:CreateTab("Game Features", 7733960981)

-- Добавляем элементы
tab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = _G.AutoGemFarm or false,
    Callback = AutoGemFarm
})

tab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = _G.AutoChestFarm or false,
    Callback = AutoChestFarm
})

tab:CreateToggle({
    Name = "🏆 Insta-Win",
    CurrentValue = _G.InstaWinLoop or false,
    Callback = InstaWin
})

-- Уведомление
Rayfield:Notify({
    Title = "Success",
    Content = "Game features loaded!",
    Duration = 3,
    Image = 7733960981
})
