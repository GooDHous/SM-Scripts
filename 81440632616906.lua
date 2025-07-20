-- Всегда начинаем с проверки Window
if not Window then
    warn("Window object not found!")
    return
end

-- Получаем название игры
local gameName
pcall(function()
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)
gameName = gameName or "Current Game"

-- Создаем вкладку
local gameTab = Window:CreateTab(gameName, 7733960981)

-- 1. Ваша функция Auto Gem Farm
local autoGemToggle = gameTab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoGemFarm = Value
        while _G.AutoGemFarm and task.wait(0.1) do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
            end)
        end
    end
})

-- 2. Ваша функция Auto Chest Farm
local autoChestToggle = gameTab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoChestFarm = Value
        while _G.AutoChestFarm and task.wait(0.1) do
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.TreasureEvent:FireServer("Chest")
            end)
        end
    end
})

-- 3. Ваша функция Insta-Win
local instaWinToggle = gameTab:CreateToggle({
    Name = "🏆 Smart Insta-Win",
    CurrentValue = false,
    Callback = function(Value)
        _G.InstaWinLoop = Value
        while _G.InstaWinLoop and task.wait(0.5) do
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        -- Ваш оригинальный код Insta-Win
                    end
                end
            end)
        end
    end
})

-- Успешная загрузка
Rayfield:Notify({
    Title = gameName.." Features",
    Content = "Special features loaded!",
    Duration = 5,
    Image = 7733960981
})

return true
