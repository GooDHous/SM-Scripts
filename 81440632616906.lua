-- Всегда начинаем с создания вкладки
local GameTab = Window:CreateTab("Game Features", 7733960981)

-- 1. Секция для автофарма
local FarmSection = GameTab:CreateSection("Auto Farm")

GameTab:CreateToggle({
    Name = "💰 Auto Farm Coins",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoFarmCoins = Value
        while _G.AutoFarmCoins and task.wait() do
            -- Ваш код фарма
        end
    end
})

-- 2. Секция для телепортации
local TPSection = GameTab:CreateSection("Teleport")

GameTab:CreateButton({
    Name = "📍 Teleport to Base",
    Callback = function()
        -- Код телепортации
    end
})

-- 3. Секция для боевых функций
local CombatSection = GameTab:CreateSection("Combat")

GameTab:CreateToggle({
    Name = "⚔️ Auto Attack",
    CurrentValue = false,
    Callback = function(Value)
        _G.AutoAttack = Value
        while _G.AutoAttack and task.wait() do
            -- Код атаки
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
