-- Верните функцию, которая создает вкладки
return function(Window, Rayfield)
    -- Создаем вкладку для игры
    local gameTab = Window:CreateTab("Game Features", 7733960981)
    
    -- Секция для автофарма
    local farmSection = gameTab:CreateSection("Auto Farm")
    
    -- Авто-фарм ресурсов
    gameTab:CreateToggle({
        Name = "💰 Auto Farm",
        CurrentValue = false,
        SectionParent = farmSection,
        Callback = function(Value)
            _G.AutoFarm = Value
            while _G.AutoFarm and task.wait() do
                -- Ваш код фарма
            end
        end
    })
    
    -- Секция для телепортации
    local tpSection = gameTab:CreateSection("Teleport")
    
    -- Телепорт к точке
    gameTab:CreateButton({
        Name = "📍 Teleport to Base",
        SectionParent = tpSection,
        Callback = function()
            -- Код телепортации
        end
    })
    
    -- Уведомление о загрузке
    Rayfield:Notify({
        Title = "Game Features",
        Content = "Special features loaded!",
        Duration = 3,
        Image = 7733960981
    })
end
