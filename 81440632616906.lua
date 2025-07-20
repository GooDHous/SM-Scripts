-- Упрощенный гарантированно рабочий вариант
if not Window then error("Window object not found") end

-- Обязательная проверка
local function safeCreateTab()
    local gameName = "Current Game"
    pcall(function()
        gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end)
    
    local tab = Window:CreateTab(gameName, 7733960981)
    
    -- 1. Auto Gem Farm (ваша функция)
    tab:CreateToggle({
        Name = "💎 Auto Gem Farm",
        CurrentValue = _G.AutoGemFarm or false,
        Callback = function(Value)
            _G.AutoGemFarm = Value
            while _G.AutoGemFarm and task.wait(0.1) do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.SpinPrizeEvent:FireServer(5)
                end)
            end
        end
    })
    
    -- 2. Добавьте здесь остальные ваши функции
    
    return true
end

-- Вызов и обработка ошибок
local success, err = pcall(safeCreateTab)
if not success then
    warn("[TAB ERROR]", err)
    return false
end

return true
