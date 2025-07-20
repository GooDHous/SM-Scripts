-- Все ваши оригинальные функции полностью сохранены
_G.AutoGemFarm = false
_G.AutoChestFarm = false
_G.InstaWinLoop = false

-- Создаем вкладку для текущей игры
local gameName = "Current Game"
pcall(function()
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)

local gameTab = Window:CreateTab(gameName, 7733960981)

-- 1. Секция автофарма
local farmSection = gameTab:CreateSection("Auto Farm")

-- Ваша оригинальная функция Auto Gem Farm
gameTab:CreateToggle({
    Name = "💎 Auto Gem Farm",
    CurrentValue = _G.AutoGemFarm,
    SectionParent = farmSection,
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

-- Ваша оригинальная функция Auto Chest Farm
gameTab:CreateToggle({
    Name = "💰 Auto Chest Farm",
    CurrentValue = _G.AutoChestFarm,
    SectionParent = farmSection,
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

-- 2. Секция телепортации
local tpSection = gameTab:CreateSection("Teleport")

-- Ваша оригинальная функция Insta-Win
gameTab:CreateToggle({
    Name = "🏆 Smart Insta-Win",
    CurrentValue = _G.InstaWinLoop,
    SectionParent = tpSection,
    Callback = function(Value)
        _G.InstaWinLoop = Value
        if Value then
            Rayfield:Notify({
                Title = "Insta-Win",
                Content = "Enabled smart instant win system",
                Duration = 3,
                Image = 9605261863
            })
        end
        while _G.InstaWinLoop and task.wait(0.1) do
            pcall(function()
                local player = game.Players.LocalPlayer
                local char = player.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local closestWinPart
                        local shortestDist = math.huge
                        for i = 1, 10 do
                            local world = workspace:FindFirstChild("World"..i)
                            if world then
                                local winPart = world:FindFirstChild("WinPart", true)
                                if winPart then
                                    local dist = (hrp.Position - winPart.Position).Magnitude
                                    if dist < shortestDist then
                                        shortestDist = dist
                                        closestWinPart = winPart
                                    end
                                end
                            end
                        end
                        if closestWinPart then
                            hrp.CFrame = closestWinPart.CFrame + Vector3.new(0, 8, 0)
                        end
                    end
                end
            end)
        end
    end
})

-- 3. Информационная секция
local infoSection = gameTab:CreateSection("Info")
gameTab:CreateLabel("Game: "..gameName, infoSection)
gameTab:CreateLabel("PlaceID: "..game.PlaceId, infoSection)

-- Уведомление о загрузке
Rayfield:Notify({
    Title = "Game Features Loaded",
    Content = "Special features for "..gameName.." activated!",
    Duration = 5,
    Image = 7733960981
})
